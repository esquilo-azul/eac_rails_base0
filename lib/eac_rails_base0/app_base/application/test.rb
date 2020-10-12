# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'

module EacRailsBase0App
  class Application < Rails::Application
    module Test
      common_concern do
        next unless ::Rails.env.test?

        setup('action_controller', 'general', 'log', 'public_file_server')
      end

      module ClassMethods
        def setup_action_controller
          config.action_controller.perform_caching = false
          config.action_controller.allow_forgery_protection = false
        end

        def setup_general
          config.cache_classes = true
          config.eager_load = false

          config.consider_all_requests_local = true
          config.action_controller.perform_caching = false
          config.action_dispatch.show_exceptions = false
          config.action_mailer.delivery_method = :test
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
