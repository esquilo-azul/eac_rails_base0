# frozen_string_literal: true

module EacRailsBase0
  class Ability
    include CanCan::Ability

    def initialize(user)
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
    end
  end
end
