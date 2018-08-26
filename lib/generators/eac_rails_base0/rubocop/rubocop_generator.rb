# frozen_string_literal: true

module EacRailsBase0
  class RubocopGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def install_gem
      gem 'rubocop'
    end

    def copy_bin
      copy_file 'rubocop.rb', 'bin/rubocop'
      chmod 'bin', 0755 & ~File.umask, verbose: false
    end
  end
end
