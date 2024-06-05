# frozen_string_literal: true

class Ability < EacRailsBase0::AppBase::Ability
  def initialize(user)
    super
    can :read, :home
  end
end
