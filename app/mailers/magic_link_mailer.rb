class MagicLinkMailer < ApplicationMailer
  def sign_in_instructions(magic_link)
    @magic_link = magic_link
    @identity = @magic_link.identity
    # Log directo para ver que entramos aquí
    Rails.logger.info "[MAGIC LINK MAILER] Preparing magic link email for #{@magic_link.email}"
    
    mail to: @identity.email_address, subject: "Your Fizzy code is #{ @magic_link.code }"
  end
end
