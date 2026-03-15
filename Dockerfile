# Stage 1: Build Svelte frontend
FROM node:22-alpine AS frontend
WORKDIR /build
COPY site/package*.json ./
RUN npm ci
COPY site/ ./
RUN npm run build

# Stage 2: Build Go/PocketBase server
FROM golang:1.24-alpine AS server
WORKDIR /build
COPY server/go.mod server/go.sum ./
RUN go mod download
COPY server/ ./
RUN CGO_ENABLED=0 GOOS=linux go build -trimpath -o server .

# Stage 3: Minimal runtime image
FROM alpine:3.21
RUN apk add --no-cache ca-certificates tzdata
WORKDIR /app
# Copy the compiled server binary
COPY --from=server /build/server ./server
# PocketBase serves static files from pb_public/
COPY --from=frontend /build/dist ./pb_public
EXPOSE 8090
ENTRYPOINT ["./server"]
CMD ["serve", "--http=0.0.0.0:8090"]
