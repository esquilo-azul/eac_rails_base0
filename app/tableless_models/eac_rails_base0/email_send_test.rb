# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'

module EacRailsBase0
  class EmailSendTest < ::EacRailsUtils::Models::Tableless
    attribute :alternative_address, ::String

    validates :alternative_address, allow_blank: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :logged_user_address, allow_blank: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :address, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    def save
      return false unless valid?

      send_mail
      true
    end

    def address
      alternative_address.presence || logged_user_address.presence
    end

    def logged_user_address
      ::EacUsersSupport::User.current_user.if_present(&:email)
    end

    def send_mail
      ::EacRailsBase0::SendTestMailer.with(address: address).main.deliver_later
    end
  end
end
