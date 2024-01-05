# frozen_string_literal: true

unless Rails.env.test?
  Rails.application.configure do
    config.action_mailer.smtp_settings = {
      address: ENV.fetch('action_mailer_smtp_address', nil),
      port: ENV.fetch('action_mailer_smtp_port', nil),
      domain: ENV.fetch('action_mailer_smtp_domain', nil),
      user_name: ENV.fetch('action_mailer_smtp_username', nil),
      password: ENV.fetch('action_mailer_smtp_password', nil),
      authentication: ENV.fetch('action_mailer_smtp_authentication', nil),
      enable_starttls_auto:
        EacRubyUtils::Boolean.parse(ENV.fetch('action_mailer_smtp_enable_starttls_auto', nil))
    }
    %i[host port].each do |option|
      value = ENV.fetch("action_mailer_default_url_#{option}", nil)
      if value.present?
        config.action_mailer.default_url_options ||= {}
        config.action_mailer.default_url_options[option] = value
      end
    end
    config.action_mailer.default_options ||= {}
    config.action_mailer.default_options[:from] =
      ENV.fetch('action_mailer_default_options_from', nil)
    config.action_mailer.default_options[:reply_to] =
      ENV.fetch('action_mailer_default_options_reply_to', nil)
  end
end
