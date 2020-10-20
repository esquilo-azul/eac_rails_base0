# frozen_string_literal: true

unless ::Rails.env.test?
  Rails.application.configure do
    config.action_mailer.smtp_settings = {
      address: ENV['action_mailer_smtp_address'],
      port: ENV['action_mailer_smtp_port'],
      domain: ENV['action_mailer_smtp_domain'],
      user_name: ENV['action_mailer_smtp_username'],
      password: ENV['action_mailer_smtp_password'],
      authentication: ENV['action_mailer_smtp_authentication'],
      enable_starttls_auto:
        ::EacRailsBase0::BooleanValue.to_b(ENV['action_mailer_smtp_enable_starttls_auto'])
    }
    %i[host port].each do |option|
      value = ENV["action_mailer_default_url_#{option}"]
      if value.present?
        config.action_mailer.default_url_options ||= {}
        config.action_mailer.default_url_options[option] = value
      end
    end
    config.action_mailer.default_options ||= {}
    config.action_mailer.default_options[:from] = ENV['action_mailer_default_options_from']
    config.action_mailer.default_options[:reply_to] = ENV['action_mailer_default_options_reply_to']
  end
end
