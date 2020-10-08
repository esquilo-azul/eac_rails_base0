# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'

module EacRailsBase0App
  class Application < Rails::Application
    module Test
      common_concern do
        next unless ::Rails.env.test?

        setup('action_controller', 'general', 'log')
      end

      module ClassMethods
        def setup_action_controller
          config.action_controller.perform_caching = false
          config.action_controller.allow_forgery_protection = false
        end

        def setup_general
          config.cache_classes = true
          config.eager_load = false
          config.serve_static_files = true
          config.static_cache_control = 'public, max-age=3600'
          config.consider_all_requests_local = true
          config.action_dispatch.show_exceptions = false
          config.action_mailer.delivery_method = :test
          config.active_support.test_order = :random
        end

        def setup_log
          config.active_support.deprecation = :stderr
        end
      end
    end
  end
end
