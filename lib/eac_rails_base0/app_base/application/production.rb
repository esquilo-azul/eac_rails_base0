# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'

module EacRailsBase0App
  class Application < Rails::Application
    module Production
      common_concern do
        next unless ::Rails.env.production?

        setup('assets', 'general', 'log')
      end

      module ClassMethods
        def setup_assets
          config.assets.js_compressor = :uglifier
          config.assets.compile = false
          config.assets.digest = true
        end

        def setup_general
          config.cache_classes = true
          config.eager_load = true
          config.consider_all_requests_local       = false
          config.action_controller.perform_caching = true
          config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?
          config.i18n.fallbacks = true
          config.active_record.dump_schema_after_migration = false
        end

        def setup_log
          config.active_support.deprecation = :notify
          config.log_level = :debug
          config.log_formatter = ::Logger::Formatter.new
        end
      end
    end
  end
end
