module SignUpHelper

  def sign_up_as(first_name,last_name, email, password,password2)
    log.info "Sign up with: First name=#{first_name}, LastName=#{last_name}, Email=#{email}, Password=#{password}, PasswordConfirmation=#{password2}"
    fill_form(first_name,last_name, email, password, password2)
    sign_up_submit
    ConfirmationInstructionEmail.find_by_recipient(email).confirm_my_account
  end

  def fill_form(first_name, last_name,email, password, password2)
    log.info "fill new user's form"
    fill_in(field_locator(:email), with: email) unless email.nil?
    fill_in(field_locator(:firstname), with: first_name) unless first_name.nil?
    fill_in(field_locator(:lastname), with: last_name) unless last_name.nil?
    fill_in(field_locator(:password), with: password) unless password.nil?
    fill_in(field_locator(:verifypassword), with: password2) unless password2.nil?
    self
  end

  def sign_up_submit
    log.info "submit form"
    click_button button_locator (:register)
  end

  def sign_up_without_confirmation(user)
    SignUpPage.
        open.fill_form(
        user_name: user.full_name,
        email: user.email,
        password: user.password,
        password_confirmation: user.password).
        submit_form
    expect(HomePage.given.text).to include('A message with a confirmation link has been sent to your email address. Please open the link to activate your account.')
  end

  def log_in_as(user)
    LoginPage.
        open.
        fill_form(email: user.email, password: user.password).
        submit_form
    expect(HomePage).to be_authenticated
    HomePage.wait_for_opened
  end

  def log_in_as_admin
    SignUpPage.
        open.
        fill_form(email: settings.def_test_user, password: settings.def_test_pass).
        submit_form
    expect(HomePage).to be_authenticated
    HomePage.wait_for_opened
  end

  def open_page
    log.info 'Open SignUp page'
    click_button locator(:signup)
  end

end

RSpec.configure do |config|
  config.include SignUpHelper
end
