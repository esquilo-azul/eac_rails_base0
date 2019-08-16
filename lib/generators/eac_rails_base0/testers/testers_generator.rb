# frozen_string_literal: true

module EacRailsBase0
  class TestersGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def create_initializer_files
      copy_file 'Rakefile', 'Rakefile'
      copy_file 'rspec.rc', '.rspec'
      copy_file 'spec_rails_helper.rb', 'lib/spec_rails_helper.rb'
      copy_file 'bin_rspec.rb', 'bin/rspec'
    end
  end
end
