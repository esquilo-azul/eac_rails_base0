# frozen_string_literal: true

require 'pathname'

module EacRailsBase0
  module Paths
    class << self
      # @return [Pathname]
      def engines_subpath
        ::Pathname.new('engines')
      end

      def sub_gems_subpath
        ::Pathname.new('sub').join('gems')
      end
    end
  end
end
