# frozen_string_literal: true

module EacRailsBase0
  module Patches
    module EacRailsUtilsLinksHelper
      class << self
        def included(base)
          base.prepend(InstanceMethods)
          base.prepend(::CanCanDryHelper)
        end
      end

      module InstanceMethods
        def short_object_link(object, action = nil, options = {})
          value_or_sign(object, '') do |value|
            path = object_path(value, action)
            link_to '', url_for(path), options if can_by_path?(path, options[:method])
          end
        end

        def object_path_by_class(*args)
          super.gsub(/_url\z/, '_path')
        end
      end
    end
  end
end

require 'eac_rails_utils/links_helper'
patch = EacRailsBase0::Patches::EacRailsUtilsLinksHelper
target = EacRailsUtils::LinksHelper
target.prepend(patch) unless target.include?(patch)
