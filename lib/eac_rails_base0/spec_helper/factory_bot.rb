# frozen_string_literal: true

require 'factory_bot_rails'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

::FactoryBot.definition_file_paths += ::EacRailsBase0::XEngine.local.flat_map do |engine|
  %w[factories test/factories spec/factories].map do |subpath|
    engine.config.root.join(subpath).to_path
  end
end

::FactoryBot.find_definitions

Spring.after_fork { FactoryBot.reload } if defined?(Spring)
