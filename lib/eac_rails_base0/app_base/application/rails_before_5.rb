# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'

module EacRailsBase0App
  class Application < Rails::Application
    module RailsBefore5
      common_concern do
        next unless ::Rails.version < '5'

        config.active_record.raise_in_transactional_callbacks = true
      end
    end
  end
end
