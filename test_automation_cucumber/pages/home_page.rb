class HomePage < WebPage

  url '/'
  validate :url, pattern: /\A(?:.*?:\/\/)?[^\/]*\/?\z/


  add_locator :login, '/login/'
  add_button_locator :signup_home, 'Sign up'

  def open_signup_page
    log.info "open Sign Up page"
    #click_button button_locator(:signup_home)
    SignupPage.open
  end
end