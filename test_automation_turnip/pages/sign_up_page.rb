class SignupPage < WebPage

  url '/signup'
  validate :title, pattern: /\AnCrypted Cloud/

  add_button_locator :login, 'Login'
  add_locator :registration, 'registration'
  add_locator :check_text, '.errorlist>li'
  add_field_locator :firstname, 'id_first_name'
  add_field_locator :lastname, 'id_last_name'
  add_field_locator :email, 'id_email'
  add_field_locator :password, 'id_password'
  add_field_locator :verifypassword, 'id_password2'
  add_button_locator :register, 'Register'
  add_button_locator :resend, 'Resend Verification Email'
  add_locator :verification_text, class: 'alert alert-success'
  add_locator :complete_text,'registration-complete-message'
  add_link_locator :warning_text, 'alert alert-warning'


  def fill_form(email, first_name, last_name, password, password2)
    log.info "fill new user's form"
    fill_in(field_locator(:email), with: email) unless email.nil?
    fill_in(field_locator(:firstname), with: first_name) unless first_name.nil?
    fill_in(field_locator(:lastname), with: last_name) unless last_name.nil?
    fill_in(field_locator(:password), with: password) unless password.nil?
    fill_in(field_locator(:verifypassword), with: password2) unless password2.nil?
    self
  end

  def sign_up_submit
    click_button button_locator (:register)
  end

  def sign_up_as(first_name, last_name, email, password, password2)
    fill_form(id_first_name: first_name, id_last_name: last_name, id_email: email, id_password: password, id_password2: password2)
    sign_up_submit
    HomePage.given
  end
end