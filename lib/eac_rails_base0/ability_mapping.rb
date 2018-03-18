# frozen_string_literal: true

module EacRailsBase0
  class AbilityMapping
    include CanCanDry::AbilityMapping
    include CanCanDry::AbilityMappingSets::Devise

    def initialize
      map_devise
      map_controller 'EacUsersSupport::Admin::Users', :manage, ::EacUsersSupport::User
    end
  end
end
