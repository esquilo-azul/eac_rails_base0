# frozen_string_literal: true
require 'eac_ruby_utils/gem'

module EacRailsBase0
  module Gems
    class << self
      enable_simple_cache

      def vendor_gems_root
        ::Rails.root.join('vendor', 'gems')
      end

      private

      def app_uncached
        ::EacRubyUtils::Gem.new(::Rails.root)
      end

      def all_uncached
        vendor_gems + [app]
      end

      def vendor_gems_uncached
        r = []
        vendor_gems_root.each_child.each do |child|
          r << ::EacRubyUtils::Gem.new(child) if child.directory?
        end
        r
      end
    end
  end
end
