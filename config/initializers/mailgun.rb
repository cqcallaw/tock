#ref: http://www.leemunroe.com/send-automated-email-ruby-rails-mailgun/
Rails.application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { host: 'www.brainvitamins.net' }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.smtp_settings = {
    authentication: :plain,
    address: 'smtp.mailgun.org',
    port: 587,
    domain: 'mg.brainvitamins.net',
    user_name: 'tock@mg.brainvitamins.net',
    password: ENV["MAILGUN_PASSWORD"]
  }
end
