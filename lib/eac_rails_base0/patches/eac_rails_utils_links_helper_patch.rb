# frozen_string_literal: true

module EacRailsBase0
  module Patches
    module EacRailsUtilsLinksHelper
      class << self
        def included(base)
          base.include(InstanceMethods)
          base.alias_method_chain :short_object_link, :base0
          base.alias_method_chain :object_path_by_class, :base0
        end
      end

      module InstanceMethods
        def short_object_link_with_base0(object, action = nil, options = {})
          value_or_sign(object, '') do |value|
            path = object_path(value, action)
            if can_by_path?(path, options[:method])
              link_to '', url_for(path), options
            end
          end
        end

        def object_path_by_class_with_base0(*args)
          object_path_by_class_without_base0(*args).gsub(/_url\z/, '_path')
        end
      end
    end
  end
end

require_dependency 'eac_rails_utils/links_helper'
patch = ::EacRailsBase0::Patches::EacRailsUtilsLinksHelper
target = ::EacRailsUtils::LinksHelper
target.send(:include, patch) unless target.included_modules.include?(patch)
