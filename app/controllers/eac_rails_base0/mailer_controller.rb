# frozen_string_literal: true

module EacRailsBase0
  class MailerController < ::EacRailsBase0::ApplicationController
    def info
      klass = ::ActionMailer::Base
      @sections = %w[default_params default_url_options smtp_settings].map do |section|
        ["#{klass}.#{section}", klass.send(section)]
      end.to_h
    end
  end
end
