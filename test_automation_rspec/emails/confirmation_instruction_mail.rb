class ConfirmationInstructionEmail < Email
  SUBJECT = "Your account registration with nCrypted Cloud"

  def addressed_to?(new_user)
    /Hi #{new_user}/ === plain_text_body
  end

  def confirm_my_account
    log.info "confirm my acount"
    WebPage.visit confirmation_link
  end

  def confirmation_link
    log.info "confirmation link"
    res = plain_text_body[/href="(http(s?):\/\/.+)\/" target="_blank"\>Continue</,1]
    log.error("Confirmation link was not found") if res.nil?
    res
  end
end
