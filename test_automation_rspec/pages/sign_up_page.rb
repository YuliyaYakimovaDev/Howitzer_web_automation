class SignUpPage < WebPage

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

end
