# frozen_string_literal: true

class Ability < ::EacRailsBase0::Ability
  def initialize(*args)
    super
    can :read, :public
  end
end
