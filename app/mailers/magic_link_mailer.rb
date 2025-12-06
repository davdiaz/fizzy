class MagicLinkMailer < ApplicationMailer
  def sign_in_instructions(magic_link)
    @magic_link = magic_link
    @identity = @magic_link.identity

    # Logs útiles para ti
    Rails.logger.info "[MAGIC LINK MAILER] Preparing magic link email for #{@identity.email_address}"
    Rails.logger.info "[MAGIC LINK MAILER] Code: #{@magic_link.code}"

    mail to: @identity.email_address,
         subject: "Your Fizzy code is #{ @magic_link.code }"
  end
end
