# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'

module EacRailsBase0App
  class Application < Rails::Application
    module Production
      common_concern do
        next unless ::Rails.env.production?

        setup('assets', 'general', 'log', 'public_file_server')
      end

      module ClassMethods
        def setup_assets
          config.assets.js_compressor = :uglifier
          config.assets.compile = false
        end

        def setup_general
          config.active_record.dump_schema_after_migration = false
          config.cache_classes = true
          config.eager_load = false
          config.consider_all_requests_local = false
          config.action_controller.perform_caching = true
          config.read_encrypted_secrets = true
          config.action_mailer.perform_caching = false
          config.i18n.fallbacks = true
        end

        def setup_log
          config.log_level = :debug
          config.log_tags = [:request_id]
          config.active_support.deprecation = :notify
          config.log_formatter = ::Logger::Formatter.new
          return if ENV['RAILS_LOG_TO_STDOUT'].blank?

          logger = ActiveSupport::Logger.new(STDOUT)
          logger.formatter = config.log_formatter
          config.logger = ActiveSupport::TaggedLogging.new(logger)
        end

        def setup_public_file_server
          config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
        end
      end
    end
  end
end
