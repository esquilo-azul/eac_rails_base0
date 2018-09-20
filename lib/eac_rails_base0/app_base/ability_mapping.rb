# frozen_string_literal: true

module EacRailsBase0
  module AppBase
    class AbilityMapping
      include CanCanDry::AbilityMapping
      include CanCanDry::AbilityMappingSets::Devise

      def initialize
        map_devise
        map_controller 'EacUsersSupport::Admin::Users', :manage, ::EacUsersSupport::User
        map_controller 'Aranha::Addresses', :manage, ::Aranha::Address
      end
    end
  end
end
