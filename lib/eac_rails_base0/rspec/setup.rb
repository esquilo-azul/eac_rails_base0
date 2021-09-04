# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'
require 'factory_bot'

module EacRailsBase0
  module Rspec
    module Setup
      def self.extended(obj)
        return unless obj.rails_app_path

        %w[engines admin_user non_admin_user admin_example non_admin_example
           anonymous_example].each do |m|
          obj.send("setup_#{m}")
        end
      end

      private

      def setup_engines
        ::FactoryBot.definition_file_paths += ::EacRailsBase0::XEngine.local.flat_map do |engine|
          %w[factories test/factories spec/factories].map do |subpath|
            engine.config.root.join(subpath).to_path
          end
        end
        ::FactoryBot.find_definitions
      end

      def setup_admin_user
        ::FactoryBot.define do
          factory :admin_user, class: ::EacUsersSupport::User do
            email { 'admin@example.com' }
            password { 'mysecret' }
            confirmed_at { ::Time.zone.now }
          end
        end
      end

      def setup_non_admin_user
        ::FactoryBot.define do
          factory :non_admin_user, class: ::EacUsersSupport::User do
            email { 'nonadmin@example.com' }
            password { 'mysecret' }
            confirmed_at { ::Time.zone.now }
          end
        end
      end

      def setup_admin_example
        require 'eac_rails_base0/rspec/shared_contexts/when_user_is_admin'
      end

      def setup_non_admin_example
        require 'eac_rails_base0/rspec/shared_contexts/when_user_is_non_admin'
      end

      def setup_anonymous_example
        require 'eac_rails_base0/rspec/shared_contexts/when_user_is_anonymous'
      end
    end
  end
end
