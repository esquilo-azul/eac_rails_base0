# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'

module EacRailsBase0App
  class Application < Rails::Application
    module All
      common_concern do
        setup('local_configuration', 'assets_cache', 'dependencies', 'localization', 'load_paths',
              'loggers')
      end

      module ClassMethods
        def app_temporary_directory
          ::File.join(::Dir.tmpdir, ::Rails.root.to_path.parameterize, 'tmp')
        end

        def rails_root(dir)
          return dir if ::File.exist?(::File.join(dir, 'config.ru'))
          raise 'config.ru not found in ascendent path' if dir == '/'

          rails_root(::File.dirname(dir))
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

        def setup_local_configuration
          local_configuration = ::File.join(rails_root(APP_PATH), 'config',
                                            'local_configuration.rb')
          require local_configuration if File.exist?(local_configuration)
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
