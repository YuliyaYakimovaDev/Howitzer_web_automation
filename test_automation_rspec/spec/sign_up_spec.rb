require 'spec_helper'
require 'sign_up_helper'
include SignUpHelper
include Gen

RSpec.feature 'SignUp functionality' do
  scenario 'User should be able to sign up with user credentials' do
    BlankPage.instance
    SignUpPage.open
    SignUpPage.sign_up_as(Gen.serial, Gen.serial, "u#{Gen.serial}@#{settings.mailgun_domain}", settings.def_test_pass, settings.def_test_pass, )
    expect(SignUpPage.given.text).to include("A verification email message is sent to #{email} ! Please follow instructions in the email to complete your account creation.")
    expect(UserPage).given
  end

  scenario 'User should not be able to sign up with blank data' do
    BlankPage.instance
    SignUpPage.open
    SignUpPage.fill_form("", "", "", "", "").sign_up_submit
    expect(SignUpPage.given.text).to include("This field is required.")
  end

  scenario 'User should not be able to sign up with short (less than 8 symbols) password' do
    BlankPage.instance
    SignUpPage.open
    SignUpPage.fill_form("yuliya", "test", "test@email.address", "123", "123").sign_up_submit
    expect(SignUpPage.given.text).to include("Ensure this value has at least 8 characters (it has 3).")
  end

  scenario 'User should be able to sign up with mismathced password' do
    BlankPage.instance
    SignUpPage.open
    SignUpPage.fill_form("yuliya", "test", "test@email.address", "12345678", "123").sign_up_submit
    expect(SignUpPage.given.text).to include("Password fields did not match")
  end
  scenario 'User should be able to sign up with mismathced password' do
    BlankPage.instance
    SignUpPage.open
    SignUpPage.fill_form("yuliya", "test", "yuliyaya8888@gmail.com", "12345678", "123").sign_up_submit
    expect(SignUpPage.given.text).to include("Email already exists in our system")
  end
end