# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'

module EacRailsBase0App
  class Application < Rails::Application
    module Development
      common_concern do
        next unless ::Rails.env.development?

        setup('assets', 'general', 'log', 'letter_opener')
      end

      module ClassMethods
        def setup_assets
          config.assets.debug = true
          config.assets.digest = true
          config.assets.raise_runtime_errors = true
        end

        def setup_general
          config.cache_classes = false
          config.eager_load = false
          config.consider_all_requests_local = true
          config.action_controller.perform_caching = false
          config.action_mailer.raise_delivery_errors = false

          config.active_record.migration_error = :page_load
        end

        def setup_letter_opener
          require 'letter_opener'
          config.action_mailer.delivery_method = :letter_opener
          config.action_mailer.perform_deliveries = true
        end

        def setup_log
          config.active_support.deprecation = :log
          config.logger = Logger.new(STDOUT)
        end
      end
    end
  end
end
