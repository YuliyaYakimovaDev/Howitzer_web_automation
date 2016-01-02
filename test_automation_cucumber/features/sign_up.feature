Feature: Sign up to nCryptedCloud
  As a user
  I want to be able to sign up to nCryptedCloud website
  So I can login with a new account

  Scenario: user can open sign up menu by click on button
    Given home page of website
    When I click on Sign Up menu item on home page
    Then I should be redirected to SignUp page

  Scenario: visitor can initiate sign up
    Given home page of website
    When I click on Sign Up menu item on home page
    Then I should be redirected to SignUp page

  Scenario: user can sign up with correct credentials
    Given signUp page of the website
    When I fill form on sign up page with data:
      | id_email      | test@email.address       |
      | id_first_name | yuliya                   |
      | id_last_name  | test                     |
      | id_password   | 12345678                 |
      | id_password2  | 12345678                 |
    And I submit sign up form on sign up page
    Then I shouldn't be logged in the system
    And I should see following text on login page
      """
      A verification email message is sent to test@email.address! Please follow instructions in the email to complete your account creation.
      """
    And I should receive confrmation instruction email for test@email.address recipient
    When I confirm test@email.address account from confirmation instruction email
    Then I am redirected to User Page
    Then I click Settings in dropdown menu
    Then I am redirected to Identities Page
    And I should see "Approved" text for personal identity

  Scenario: user can not sign up with blank data
    Given signUp page of the website
    When I fill form on sign up page with data:
      |id_email      |  |
      |id_first_name |  |
      |id_last_name  |  |
      |id_password   |  |
      |id_password2  |  |
    And I submit sign up form on sign up page
    And I should see following text on login page
    """
    This field is required.
    """

  Scenario: user can not sign up with short password
    Given signUp page of the website
    When I fill form on sign up page with data:
      | id_email      | test@email.adress     |
      | id_first_name | yuliya                |
      | id_last_name  | test                  |
      | id_password   | 123                   |
      | id_password2  | 123                   |
    And I submit sign up form on sign up page
    Then I shouldn't be logged in the system
    And I should see following text on login page
    """
    Ensure this value has at least 8 characters (it has 3).
    """
  Scenario: user can not sign up with mismatched password
    Given signUp page of the website
    When I fill form on sign up page with data:
      | id_email      | test@email.adress         |
      | id_first_name | yuliya                    |
      | id_last_name  | test                      |
      | id_password   | 12345678                  |
      | id_password2  | 123                       |
    And I submit sign up form on sign up page
    Then I shouldn't be logged in the system
    And I should see following text on login page
    """
    Password fields did not match
    """

  Scenario: user cannot sign up with duplicated email
    Given there is registered test@email.address user
    And signUp page of the website
    When I fill form on sign up page with data:
      | id_email      | yuliyaya8888@gmail.com    |
      | id_first_name | yuliya                    |
      | id_last_name  | test                      |
      | id_password   | 12345678                  |
      | id_password2  | 12345678                  |
    And I submit sign up form on sign up page
    Then I shouldn't be logged in the system
    And I should see following text on login page
    """
    Email already exists in our system
    """
