@user_login @all
Feature: As a user, I can login into the application

Scenario: User enters valid credentials
  Given the user is on the application login screen
  When the user enters correct credentials
  Then the application is on the default dashboard screen
