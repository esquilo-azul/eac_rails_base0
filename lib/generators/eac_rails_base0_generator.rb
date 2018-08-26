# frozen_string_literal: true

class EacRailsBase0Generator < Rails::Generators::Base
  SUB_GENERATORS = %w(rspec).freeze

  def run_other_generators
    SUB_GENERATORS.each do |generator|
      generate "eac_rails_base0:#{generator}"
    end
  end
end
