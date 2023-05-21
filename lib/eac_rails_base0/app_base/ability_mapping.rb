# frozen_string_literal: true

module EacRailsBase0
  module AppBase
    class AbilityMapping
      include CanCanDry::AbilityMapping
      include CanCanDry::AbilityMappingSets::ActiveScaffold
      include CanCanDry::AbilityMappingSets::Devise
      include CanCanDry::AbilityMappingSets::DeviseInvitable

      def initialize
        map_devise
        map_devise_invitable
        map_controller 'EacUsersSupport::Admin::Users', :manage, ::EacUsersSupport::User
        map_aranha
        map_br_railties
        map_controller 'ScheduledTasks', :manage, ::ScheduledTask
        map_controller 'TasksSchedulerDaemon', :manage, ::ScheduledTask
        map_eac_rails_base0
      end

      def map_eac_rails_base0
        map_controller 'EacRailsBase0::Mailer', :manage, :eac_rails_base0_mailer
      end

      def map_aranha
        map_controller 'Aranha::Addresses', :manage, ::Aranha::Address
        map_controller 'Aranha::ProcessorConfigurations', :manage, ::Aranha::ProcessorConfiguration
        map_controller 'Aranha::StartPoints', :manage, ::Aranha::StartPoint
      end

      def map_br_railties
        map_controller 'BrRailties::FederalUnits', :manage, ::BrRailties::FederalUnit
        map_controller 'BrRailties::Municipalities', :manage, ::BrRailties::Municipality
      end
    end
  end
end
