class HomePage < WebPage

  url '/'
  validate :url, pattern: /\A(?:.*?:\/\/)?[^\/]*\/?\z/


  add_locator :login, '/login/'
  add_locator :signup, '.btn btn-navbar'

  def open_page
    log.info 'Open SignUp page'
    click_link locator(:login)
  end

end