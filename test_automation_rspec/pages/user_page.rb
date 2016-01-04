class UserPage < WebPage

  url '/cloudwebportal/auth/'
  validate :url, pattern: /\A(?:.*?:\/\/)?[^\/]*\/?\z/

end