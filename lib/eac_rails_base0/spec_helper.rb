# frozen_string_literal: true

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  ::Rails.logger.fatal(e)
  ::Kernel.exit 1 # rubocop:disable Rails/Exit
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.example_status_persistence_file_path = ::Rails.root.join('tmp', 'cache', 'rspec.txt')
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

require 'eac_ruby_utils/require_sub'
::EacRubyUtils.require_sub __FILE__
require 'aranha/parsers/spec/source_target_fixtures_example'
