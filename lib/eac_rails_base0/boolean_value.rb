# frozen_string_literal: true

module EacRailsBase0
  class BooleanValue
    def self.to_b(object)
      return false if object.blank?

      if object.is_a?(String)
        object = object.strip
        object.present? && object != '0' && object != 'false'
      else
        object ? true : false
      end
    end
  end
end
