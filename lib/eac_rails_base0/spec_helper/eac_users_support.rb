# frozen_string_literal: true

require 'devise'

RSpec.configure do |config|
  config.include Warden::Test::Helpers

  config.after(:each) do
    Warden.test_reset!
  end
end

FactoryBot.define do
  factory :user, class: ::EacUsersSupport::User do
    email { 'admin@example.com' }
    password { 'mysecret' }
    confirmed_at { ::Time.zone.now }
  end
end

RSpec.shared_context 'when user is admin', shared_context: :metadata do
  let(:user) { ::FactoryBot.create(:user) }

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

RSpec.shared_context 'when user is anonymous', shared_context: :metadata do
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

  def link_exist?(locator)
    find_link(locator)
    true
  rescue Capybara::ElementNotFound
    false
  end
end
