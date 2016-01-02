module SignUpHelper
  def sign_up_as(user)
    SignUpPage.
        open.fill_form(
        first_name: user.full_name,
        email: user.email,
        password: user.password,
        password_confirmation: user.password).
        submit_form
    ConfirmationInstructionEmail.
        find_by_recipient(user.email).
        confirm_my_account
    expect(LoginPage.given.text).to include('Your account was successfully confirmed.')
  end

  def fill_form(id_first_name, id_last_name, id_email, id_password, id_password2)
    log.info "fill new user's form"
    fill_in(field_locator(:firstname), with: id_first_name) unless id_first_name.nil?
    fill_in(field_locator(:lastname), with: id_last_name) unless id_last_name.nil?
    fill_in(field_locator(:email), with: id_email) unless id_email.nil?
    fill_in(field_locator(:password), with: id_password) unless id_password.nil?
    fill_in(field_locator(:verifypassword), with: id_password2) unless id_password2.nil?
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
    LoginPage.
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
