Feature: Sign up to nCryptedCloud
  As a user
  I want to be able to sign up to nCryptedCloud website
  So I can login with a new account

  Background:
    Given signUp page of the website

    Scenario: "User should login with new data"
    When I fill form on sign up page with data:
    And I submit sign up form on sign up page
    Then I shouldn't be logged in the system
    And I should see following text1 on login page
    And I should receive confrmation instruction email for test@email.address recipient
    When I confirm test@email.address account from confirmation instruction email
    Then I am redirected to User Page
    Then I click Settings in dropdown menu
    Then I am redirected to Identities Page
    And I should see "Approved" text for personal identity

  Scenario: "user can not sign up with blank data"
    When I fill form on sign up page with data:
      |id_email      |  |
      |id_first_name |  |
      |id_last_name  |  |
      |id_password   |  |
      |id_password2  |  |
    And I submit sign up form on sign up page
    And I should see following text2 on login page
    """
    This field is required.
    """
  Scenario: "user can not sign up with short password"
    When I fill form on sign up page with data:
      | id_email      | test@email.adress     |
      | id_first_name | yuliya                |
      | id_last_name  | test                  |
      | id_password   | 123                   |
      | id_password2  | 123                   |
    And I submit sign up form on sign up page
    Then I shouldn't be logged in the system
    And I should see following3 text on login page
    """
    Ensure this value has at least 8 characters (it has 3).
    """
  Scenario: "user can not sign up with mismatched password"
    When I fill form on sign up page with data:
      | id_email      | test@email.adress         |
      | id_first_name | yuliya                    |
      | id_last_name  | test                      |
      | id_password   | 12345678                  |
      | id_password2  | 123                       |
    And I submit sign up form on sign up page
    Then I shouldn't be logged in the system
    And I should see following text4 on login page
    """
    Password fields did not match
    """

  Scenario: "user cannot sign up with duplicated email"
    And signUp page of the website
    When I fill form on sign up page with data:
      | id_email      | test@email.adress         |
      | id_first_name | yuliya                    |
      | id_last_name  | test                      |
      | id_password   | 12345678                  |
      | id_password2  | 12345678                  |
    And I submit sign up form on sign up page
    Then I shouldn't be logged in the system
    And I should see following text5 on login page
    """
    Email already exists in our system
    """
