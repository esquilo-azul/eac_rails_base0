# frozen_string_literal: true

class AbilityMapping < ::EacRailsBase0::AbilityMapping
  def initialize(*args)
    super
    map_action 'Welcome', 'index', :read, :public
  end
end
