# frozen_string_literal: true

require 'eac_ruby_gems_utils/gem'

module EacRailsBase0
  module Gems
    class << self
      enable_simple_cache

      def vendor_gems_root
        ::Rails.root.join('vendor', 'gems')
      end

      private

      def app_uncached
        ::EacRubyGemsUtils::Gem.new(::Rails.root)
      end

      def all_uncached
        vendor_gems + [app]
      end

      def vendor_gems_uncached
        r = []
        vendor_gems_root.each_child.each do |child|
          r << ::EacRubyGemsUtils::Gem.new(child) if child.directory?
        end
        r
      end
    end
  end
end
