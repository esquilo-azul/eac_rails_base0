# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'
require 'eac_rails_base0/paths'
require 'find'
require 'delegate'

module EacRailsBase0
  # A extended version of [Rails::Engine].
  class XEngine < SimpleDelegator
    class << self
      enable_simple_cache

      def require_local
        local_roots.each do |root|
          require_dependency "#{root.basename.to_path.gsub('-', '/')}/engine"
        end
      end

      def local_root
        ::Rails.root.join(::EacRailsBase0::Paths.engines_subpath)
      end

      private

      def all_uncached
        ::Rails::Engine.subclasses.map { |engine_class| new(engine_class.instance) }
      end

      def local_uncached
        all.select(&:local?)
      end

      def local_roots
        local_root.glob('*/*.gemspec').map(&:parent)
      end
    end

    def local?
      return false unless self.class.local_root.directory?

      ::Find.find(self.class.local_root.to_path).include?(config.root.to_path)
    end

    def namespace_module_name
      __getobj__.class.name.deconstantize
    end
  end
end
