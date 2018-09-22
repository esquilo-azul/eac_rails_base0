# frozen_string_literal: true

require 'rails/generators/rails/app/app_generator'
require 'eac_rails_base0/app_generator/builder'

module EacRailsBase0
  module AppGenerator
    class Generator < Rails::Generators::AppGenerator
      source_root ::File.join(__dir__, 'templates')
      source_paths << source_root << ::Rails::Generators::AppGenerator.source_root

      def initialize(*args)
        super
      end

      protected

      def get_builder_class # rubocop:disable Naming/AccessorMethodName
        ::EacRailsBase0::AppGenerator::Builder
      end
    end
  end
end
