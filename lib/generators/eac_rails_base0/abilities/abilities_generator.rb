# frozen_string_literal: true

module EacRailsBase0
  class AbilitiesGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def copy_bin
      %w[ability ability_mapping].each do |base|
        copy_file "#{base}.rb", "lib/#{base}.rb"
      end
    end
  end
end
