# frozen_string_literal: true

module EacRailsBase0
  class SendTestMailer < ::ApplicationMailer
    def main
      @subject = "#{t('eac_rails_base0.mailer.send_test')} [#{::Time.zone.now}]"
      mail(to: params.fetch(:address), subject: @subject)
    end
  end
end
