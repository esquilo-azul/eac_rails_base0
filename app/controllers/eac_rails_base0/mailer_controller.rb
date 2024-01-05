# frozen_string_literal: true

module EacRailsBase0
  class MailerController < ::EacRailsBase0::ApplicationController
    def info
      klass = ::ActionMailer::Base
      @sections = %w[default_params default_url_options smtp_settings].to_h do |section|
        ["#{klass}.#{section}", klass.send(section)]
      end
    end

    def send_test
      @record = ::EacRailsBase0::EmailSendTest.new
    end

    def send_test_submit
      @record = ::EacRailsBase0::EmailSendTest.new(send_test_submit_params)
      if @record.save
        flash[:success] = t('eac_rails_base0.mailer.send_test_successful', address: @record.address)
        redirect_to action: :send_test
      else
        render :send_test
      end
    end

    private

    def send_test_submit_params
      params[::EacRailsBase0::EmailSendTest.model_name.param_key].permit(:alternative_address)
    end
  end
end
