Feature: Hello World
  As a user
  I want to see a greeting
  So that I know the system is working

  Scenario: Greeting the world
    Given the application is running
    When I request a greeting
    Then I should see "Hello, World!"
