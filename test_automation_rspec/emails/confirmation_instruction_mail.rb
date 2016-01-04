class ConfirmationInstructionEmail < Email
  SUBJECT = "Your account registration with nCrypted Cloud"

  def addressed_to?(new_user)
    /Hi #{new_user},/ === plain_text_body
  end

  def confirm_my_account
    WebPage.visit confirmation_link
  end

  def confirmation_link
    res = plain_text_body.scan(/"(http(s?):\/\/.+)\/\W/)
    log.error("Confirmation link was not found") if res.nil?
    res
  end
end
