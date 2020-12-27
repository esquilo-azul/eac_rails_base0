# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'
require 'eac_ruby_utils/yaml'

module EacRailsBase0App
  class Application < Rails::Application
    module Envvars
      ENVVARS_FILE_BASENAME = 'envvars'
      ENVVARS_DIRECTORY_NAME = "#{ENVVARS_FILE_BASENAME}.d"
      ENVVARS_FILE_EXTENSIONS = %w[.yml .yaml].freeze

      common_concern do
        setup('envvars')
      end

      module ClassMethods
        def config_root
          ::Rails.root.join('config')
        end

        def envvars_files
          ENVVARS_FILE_EXTENSIONS.flat_map do |extension|
            [config_root.join("#{ENVVARS_FILE_BASENAME}#{extension}")] +
              config_root.join(ENVVARS_DIRECTORY_NAME).glob("*#{extension}")
          end
        end

        def load_envvars_file(path)
          return unless path.exist?

          vars = ::EacRubyUtils::Yaml.load(path.read)
          raise "\"#{path}\" does not contain a Hash" unless vars.is_a?(::Hash)

          vars.each { |name, value| ENV[name.to_s] = value.to_s }
        end

        def setup_envvars
          envvars_files.each { |path| load_envvars_file(path) }
        end
      end
    end
  end
end
