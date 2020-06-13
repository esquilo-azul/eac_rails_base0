# frozen_string_literal: true

namespace :eac_rails_base0 do
  namespace :gems do
    desc 'Minitest and RSpec for application and local gems'
    task test_all: :environment do
      require 'eac_ruby_gems_utils/tests/multiple'
      tests = ::EacRubyGemsUtils::Tests::Multiple.new(::EacRailsBase0::Gems.all)
      raise 'Some test did not pass' unless tests.ok?
    end
  end
end
