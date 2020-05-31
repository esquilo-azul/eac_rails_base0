# frozen_string_literal: true

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

def rails_root(dir)
  return dir if ::File.exist?(::File.join(dir, 'config.ru'))
  raise 'config.ru not found in ascendent path' if dir == '/'

  rails_root(::File.dirname(dir))
end

local_configuration = ::File.join(rails_root(APP_PATH), 'config', 'local_configuration.rb')
require local_configuration if File.exist?(local_configuration)

module EacRailsBase0App
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.i18n.default_locale = :'pt-BR'

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # Autoload do código em /lib.
    config.autoload_paths << Rails.root.join('lib')

    config.after_initialize do
      ActiveRecord::Base.logger = nil
    end

    app_tmpdir = ::File.join(::Dir.tmpdir, ::Rails.root.to_path.parameterize, 'tmp')

    config.assets.configure do |env|
      env.cache = Sprockets::Cache::FileStore.new(
        ::File.join(app_tmpdir, 'cache', 'assets'),
        config.assets.cache_limit,
        env.logger
      )
    end
  end
end
