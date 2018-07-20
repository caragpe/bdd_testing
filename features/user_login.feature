@user_login @all
Feature: As a user, I can login into the application

Scenario: User can login when entering valid credentials
  Given the user is on the application login screen
  When the user enters credentials
    | username        | password |
    | valid@email.com | pAssw0rd |
  Then the application is on the default dashboard screen

Scenario: User cannot login when entering invalid credentials
  Given the user is on the application login screen
  When the user enters credentials
    | username          | password |
    | invalid@email.com | pAssw0rd |
  Then the application cannot validate the credentials

Scenario: User receives an error when entering only username
  Given the user is on the application login screen
  When the user enters his username
    | value             |
    | invalid@email.com |
  Then the application displays an error on password input field

@user_login
Scenario: User receives an error when entering only password
  Given the user is on the application login screen
  When the user enters his password
    | value    |
    | pAssw0rd |
  Then the application displays an error on username input field
