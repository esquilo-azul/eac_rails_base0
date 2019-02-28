# frozen_string_literal: true

module EacRailsBase0
  module Patches
    module UrlForPatch
      class << self
        def included(base)
          base.include(InstanceMethods)
          base.alias_method_chain :url_for, :engines
        end
      end

      module InstanceMethods
        def url_for_with_engines(options = nil)
          url_for_without_engines(options)
        rescue ActionController::UrlGenerationError
          engines_url_for(options)
        end

        private

        def engines_url_for(options)
          ::Rails::Engine.subclasses.each do |engine|
            url = engine_url_for(engine, options)
            return url if url
          end
          raise ActionController::UrlGenerationError, "Options: #{options}"
        end

        def engine_url_for(engine, options)
          engine.routes.url_for(options)
        rescue ActionController::UrlGenerationError
          nil
        end
      end
    end
  end
end

patch = ::EacRailsBase0::Patches::UrlForPatch
target = ::ActionDispatch::Routing::UrlFor
target.send(:include, patch) unless target.included_modules.include?(patch)
