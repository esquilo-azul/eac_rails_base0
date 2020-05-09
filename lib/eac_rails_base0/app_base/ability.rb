# frozen_string_literal: true

require 'active_scaffold/bridges/cancan/cancan_bridge'

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

      def devise_password_rules(user)
        return unless user.new_record?

        can :manage, 'Devise::Password'
      end

      def devise_session_rules(user)
        can :destroy, 'Devise::Session' unless user.new_record?
        can :create, 'Devise::Session'
      end

      def devise_rules(user)
        %w[password session].each do |devise_module|
          send("devise_#{devise_module}_rules", user)
        end
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
