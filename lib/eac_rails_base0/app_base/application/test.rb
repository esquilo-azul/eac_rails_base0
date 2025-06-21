# frozen_string_literal: true

module EacRailsBase0App
  class Application < Rails::Application
    module Test
      ACTION_MAILER_CONFIGS = {
        delivery_method: :test,
        default_url_options: { host: 'localhost', port: 3000 },
        default_options: { from: 'myadddress@example.net', reply_to: '' }
      }.freeze

      common_concern do
        next unless ::Rails.env.test?

        setup('action_controller', 'action_mailer', 'general', 'log', 'public_file_server')
      end

      module ClassMethods
        def setup_action_controller
          config.action_controller.perform_caching = false
          config.action_controller.allow_forgery_protection = false
        end

        def setup_action_mailer
          ACTION_MAILER_CONFIGS.each do |key, value|
            config.action_mailer.send("#{key}=", value)
          end
        end

        def setup_general
          config.cache_classes = true
          config.eager_load = false

          config.consider_all_requests_local = true
          config.action_controller.perform_caching = false
          config.action_dispatch.show_exceptions = false
        end

        def setup_log
          config.active_support.deprecation = :stderr
        end

        def setup_public_file_server
          config.public_file_server.enabled = true
          config.public_file_server.headers = {
            'Cache-Control' => "public, max-age=#{1.hour.seconds.to_i}"
          }
        end
      end
    end
  end
end
