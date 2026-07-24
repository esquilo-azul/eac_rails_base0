# frozen_string_literal: true

module EacRailsBase0
  module Patches
    module UrlFor
      class << self
        def included(base)
          base.prepend(InstanceMethods)
        end
      end

      module InstanceMethods
        def url_for(options = nil)
          super
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
