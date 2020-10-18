# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'
require 'find'
require 'delegate'

module EacRailsBase0
  # A extended version of [Rails::Engine].
  class XEngine < SimpleDelegator
    class << self
      enable_simple_cache

      def local_root
        ::Rails.root.join('engines')
      end

      private

      def all_uncached
        ::Rails::Engine.subclasses.map { |engine_class| new(engine_class.instance) }
      end

      def local_uncached
        all.select(&:local?)
      end
    end

    def initialize(engine_instance)
      super(engine_instance)
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
