Feature: Login Test
  #Agile : As a user,  I should be able to login with valid credential

  Background:
    Given The user is on the login page


  Scenario: Positive scenario 1 -user should be able to login
    When The user enters valid credentials
    Then The user verify that welcome message is "Welcome karpuzcekirdegi"


  Scenario: Positive scenario 2 -user should be able to login
    When The user enters "karpuzcekirdegi" and "12345" and click login button
    Then The user verify that welcome message is "Welcome karpuzcekirdegi"

  Scenario Outline: Positive scenario 3 -user should be able to login
    When The user enters "<username>" and "<password>" and click login button
    Then The user verify that welcome message is "<welcomeMessage>"
    Examples:
      | username        | password | welcomeMessage          |
      | karpuzcekirdegi | 12345    | Welcome karpuzcekirdegi |

  @wip
  Scenario Outline: Positive scenario 4 -user should be able to login
    When The user enters valid username and passowrd
      | username | <username> |
      | password | <password> |
    Then The user verify that welcome message is "<welcomeMessage>"
    Examples:
      | username        | password | welcomeMessage          |
      | karpuzcekirdegi | 12345    | Welcome karpuzcekirdegi |

  @negativeLoginTest
  Scenario Outline:Negative Scenario- user should NOT be able to log in with invalid credentials
    When The user enters "<invalidUsername>" and "<invalidPassword>" and click login button
    Then The user verifies that invalid credentials "<message>"
    Examples:
      | invalidUsername | invalidPassword | message                                |
      | karpuzcekirdegi |                 | Please fill out Username and Password. |
      |                 | 12345           | Please fill out Username and Password. |
      |                 |                 | Please fill out Username and Password. |
      | karpuzcekirdegi | 125345          | Wrong password.                        |
      | karpuzcekirdeg  | 12345           | User does not exist.                   |
      | karpuzcekirdeg  | 123454          | User does not exist.                   |