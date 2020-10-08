# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EacRailsBase0App
  class Application < Rails::Application
    class << self
      def setup(*args)
        args.each { |a| send("setup_#{a}") }
      end
    end

    require_sub __FILE__, include_modules: true

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true if ::Rails.version < '5'
  end
end
