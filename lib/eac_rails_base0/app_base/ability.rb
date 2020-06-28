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

      def devise_confirmation_rules(user)
        return unless user.new_record?

        can :create, 'Devise::Confirmation'
      end

      def devise_invitable_rules(user)
        can :create, 'Devise::Invitation' if user.administrator?
        can :update, 'Devise::Invitation'
        if user.new_record?
          can :create, 'DeviseInvitable::Registration'
        else
          can :update, 'DeviseInvitable::Registration'
        end
      end

      def devise_password_rules(user)
        return unless user.new_record?

        can :manage, 'Devise::Password'
      end

      def devise_registration_rules(user)
        can :create, 'Devise::Registration' if user.new_record?
        can :update, 'Devise::Registration' unless user.new_record?
      end

      def devise_session_rules(user)
        can :destroy, 'Devise::Session' unless user.new_record?
        can :create, 'Devise::Session'
      end

      def devise_rules(user)
        %w[confirmation invitable password registration session].each do |devise_module|
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
