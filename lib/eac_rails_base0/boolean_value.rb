# frozen_string_literal: true
module EacRailsBase0
  class BooleanValue
    def self.to_b(v)
      return false if v.blank?
      if v.is_a?(String)
        v = v.strip
        !v.blank? && v != '0' && v != 'false'
      else
        v ? true : false
      end
    end
  end
end
