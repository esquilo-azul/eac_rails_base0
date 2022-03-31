# frozen_string_literal: true

module EacRailsBase0
  module AppGenerator
    class Builder < Rails::AppBuilder
      def readme
        # Do nothing
      end

      def app
        directory 'app'
      end

      def config
        inside 'config' do
          template 'routes.rb'
          template 'application.rb'
          template 'environment.rb'
          template 'secrets.yml'
        end
      end

      def database_yml
        template 'config/database.yml'
      end

      def db
        directory 'db'
      end

      def lib
        directory 'lib'
      end

      def log
        # Do nothing
        empty_directory_with_keep_file 'log'
      end

      def test
        template 'test/test_helper.rb'
      end

      def tmp
        # Do nothing
      end

      def vendor
        # Do nothing
      end

      def vendor_javascripts
        # Do nothing
      end

      def vendor_stylesheets
        # Do nothing
      end
    end
  end
end
