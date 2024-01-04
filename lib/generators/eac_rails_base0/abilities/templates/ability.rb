# frozen_string_literal: true

class Ability < EacRailsBase0::AppBase::Ability
  def initialize(*args)
    super
    can :read, :public
  end
end
