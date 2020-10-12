# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'

module EacRailsBase0App
  class Application < Rails::Application
    module Development
      common_concern do
        next unless ::Rails.env.development?

        setup('assets', 'cache', 'general', 'letter_opener', 'log')
      end

      module ClassMethods
        def setup_assets
          config.assets.debug = true
          config.assets.quiet = true
        end

        def setup_cache
          if Rails.root.join('tmp/caching-dev.txt').exist?
            config.action_controller.perform_caching = true
            config.cache_store = :memory_store
            config.public_file_server.headers = {
              'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
            }
          else
            config.action_controller.perform_caching = false
            config.cache_store = :null_store
          end
        end

        def setup_general
          config.cache_classes = false
          config.eager_load = false
          config.consider_all_requests_local = true
          config.action_mailer.raise_delivery_errors = false
          config.action_mailer.perform_caching = false
          config.active_record.migration_error = :page_load
          config.file_watcher = ActiveSupport::EventedFileUpdateChecker
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
