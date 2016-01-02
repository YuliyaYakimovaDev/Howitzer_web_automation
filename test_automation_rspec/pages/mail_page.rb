class MailPage < WebPage

  url 'https://mail.google.com/mail/u/0/?pc=ru-ha-emea-ua-bk#inbox'
  validate :url, pattern: /\A(?:.*?:\/\/)?[^\/]*\/?\z/
  def get_last_email
    Mail.find(what: :last, count: 10, order: :asc)[0]
  end

  def goto_continue_link
    email = get_last_email
    log.info 'Finding Continue button'
    ncc_link = email.body.decoded.scan(/href="(http(s?):\/\/.+)\/" target="_blank"\>Continue</)[0][0]
    log.info 'Click on button in confirmation email' +ncc_link
    ncc_link.click
  end
end