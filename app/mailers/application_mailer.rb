class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch("MAILER_FROM_ADDRESS", "Fizzy <support@fizzy.do>")

  layout "mailer"
  append_view_path Rails.root.join("app/views/mailers")
  helper AvatarsHelper, HtmlHelper
  after_action :log_email_body

  private

    def log_email_body
      to = Array(mail.to).join(", ")
      Rails.logger.info "[EMAIL DEBUG] To: #{to}"
      Rails.logger.info "[EMAIL DEBUG] Subject: #{mail.subject.inspect}"
      Rails.logger.info "[EMAIL DEBUG] Body:\n#{mail.body.decoded}"
    end
    def default_url_options
      if Current.account
        super.merge(script_name: Current.account.slug)
      else
        super
      end
    end
end
