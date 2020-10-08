# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'

module EacRailsBase0App
  class Application < Rails::Application
    module Development
      common_concern do
        next unless ::Rails.env.development?

        setup('letter_opener')
      end

      module ClassMethods
        def setup_letter_opener
          require 'letter_opener'
          config.action_mailer.delivery_method = :letter_opener
          config.action_mailer.perform_deliveries = true
        end
      end
    end
  end
end
