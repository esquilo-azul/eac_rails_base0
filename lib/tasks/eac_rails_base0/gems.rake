# frozen_string_literal: true

namespace :eac_rails_base0 do
  namespace :gems do
    desc <<~DESCRIPTION
      Minitest and RSpec for application and local gems.

      Use GEMS environment variable to test only selected gems. Example:

        rake eac_rails_base0:gems:test_all GEMS=gem1_name,gem2_name
    DESCRIPTION
    task test_all: :environment do
      require 'eac_ruby_gems_utils/tests/multiple'
      gems = ::EacRailsBase0::Gems.all
      ENV['GEMS'].if_present { |v| v.to_s.split(',').map(&:strip) }.if_present do |gem_names|
        gems = gems.select { |gem| gem_names.include?(gem.to_s) }
      end
      tests = ::EacRubyGemsUtils::Tests::Multiple.new(gems)
      raise 'Some test did not pass' unless tests.ok?
    end
  end
end
