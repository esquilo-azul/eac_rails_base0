# frozen_string_literal: true

module EacRailsBase0
  class ApplicationMailer < (
      begin
        ::ApplicationMailer
      rescue StandardError
        ::ActionMailer::Base
      end
    )
  end
end
