# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'

module EacRailsBase0App
  class Application < Rails::Application
    module All
      common_concern do
        setup('app_root', 'engines', 'active_record', 'assets_cache', 'dependencies', 'defaults',
              'localization', 'load_paths', 'loggers', 'unknown_asset_fallback')
      end

      module ClassMethods
        def app_temporary_directory
          ::File.join(::Dir.tmpdir, ::Rails.root.to_path.parameterize, 'tmp')
        end

        def setup_app_root
          return unless defined?(APP_PATH)

          config.root = find_root(APP_PATH)
        end

        def setup_active_record
          config.active_record.sqlite3.represent_boolean_as_integer = true
        end

        def setup_assets_cache
          config.assets.configure do |env|
            env.cache = Sprockets::Cache::FileStore.new(
              ::File.join(app_temporary_directory, 'cache', 'assets'),
              config.assets.cache_limit,
              env.logger
            )
          end
        end

        def setup_engines
          require 'eac_rails_base0/engine'
        end

        def setup_unknown_asset_fallback
          config.assets.unknown_asset_fallback = false
        end

        def setup_defaults
          config.load_defaults 5.1
        end

        def setup_dependencies
          require 'carrierwave'
        end

        def setup_deprecated_migrations
          path = ::Rails.root.join('db', 'migrate_deprecated')
          config.paths['db/migrate'] << path if path.directory?
        end

        def setup_load_paths
          config.autoload_paths << Rails.root.join('lib')
        end

        def setup_localization
          config.i18n.default_locale = :'pt-BR'
        end

        def setup_loggers
          config.after_initialize do
            ActiveRecord::Base.logger = nil
          end
        end
      end
    end
  end
end
