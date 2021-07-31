# frozen_string_literal: true

require 'eac_ruby_utils/core_ext'
require 'factory_bot'

module EacRailsBase0
  module Rspec
    class Setup
      common_constructor :setup_obj

      def perform
        return unless defined?(::Rails)

        %w[engines admin_user non_admin_user admin_example non_admin_example
           anonymous_example].each do |m|
          send("setup_#{m}")
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

      def setup_admin_example # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
        ::RSpec.shared_context 'when user is admin', shared_context: :metadata do
          let(:user) { ::FactoryBot.create(:admin_user) }

          before do
            visit '/users/sign_in'
            fill_in ::I18n.translate!('activerecord.attributes.eac_users_support/user.email'),
                    with: user.email
            fill_in ::I18n.translate!('activerecord.attributes.eac_users_support/user.password'),
                    with: user.password
            click_button ::I18n.translate!('devise.log_in')
          end

          it 'user should be logged' do
            expect(page).to have_content user.email
            expect(::EacUsersSupport::User.current_user).not_to be_nil
          end
        end
      end

      def setup_non_admin_example # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
        ::RSpec.shared_context 'when user is non admin', shared_context: :metadata do
          let(:user) { ::FactoryBot.create(:non_admin_user) }

          before do
            visit '/users/sign_in'
            fill_in ::I18n.translate!('activerecord.attributes.eac_users_support/user.email'),
                    with: user.email
            fill_in ::I18n.translate!('activerecord.attributes.eac_users_support/user.password'),
                    with: user.password
            click_button ::I18n.translate!('devise.log_in')
          end

          it 'user should be logged' do
            expect(page).to have_content user.email
            expect(::EacUsersSupport::User.current_user).not_to be_nil
          end
        end
      end

      def setup_anonymous_example # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
        ::RSpec.shared_context 'when user is anonymous', shared_context: :metadata do
          before do
            visit '/'
            if link_exist?(::I18n.translate!('devise.log_out'))
              click_link(::I18n.translate!('devise.log_out'))
            elsif !link_exist?(::I18n.translate!('devise.log_in'))
              raise 'login nor logout link found'
            end
          end

          it 'user should be not logged' do
            expect(::EacUsersSupport::User.current_user).to be_nil
          end

          def link_exist?(locator) # rubocop:disable Lint/NestedMethodDefinition
            find_link(locator)
            true
          rescue Capybara::ElementNotFound
            false
          end
        end
      end
    end
  end
end
