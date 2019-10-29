# frozen_string_literal: true

module EacRailsBase0
  module AppBase
    class Ability
      include CanCan::Ability

      def initialize(user)
        as_action_aliases
        user ||= ::EacUsersSupport::User.new
        devise_rules(user)
        administrator_rules(user)
      end

      def devise_rules(user)
        can :destroy, 'Devise::Session' unless user.new_record?
        can :create, 'Devise::Session'
      end

      def administrator_rules(user)
        return unless user.administrator?

        can :manage, ::EacUsersSupport::User
        can :manage, ::Aranha::Address
        can :manage, ::BrRailties::FederalUnit
        can :manage, ::BrRailties::Municipality
        can :manage, ::ScheduledTask
      end
    end
  end
end
