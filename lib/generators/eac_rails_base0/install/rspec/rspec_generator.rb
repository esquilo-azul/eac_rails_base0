# frozen_string_literal: true
module EacRailsBase0
  module Install
    class RspecGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def create_initializer_files
        copy_file 'rspec.rc', '.rspec'
        copy_file 'spec_rails_helper.rb', 'lib/spec_rails_helper.rb'
        copy_file 'bin_rspec.rb', 'bin/rspec'
      end
    end
  end
end
