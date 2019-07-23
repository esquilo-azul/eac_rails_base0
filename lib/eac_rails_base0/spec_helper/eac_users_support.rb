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
  end
end

RSpec.shared_context 'when user is admin', shared_context: :metadata do
  let(:user) { ::FactoryBot.create(:user) }

  before do
    visit '/users/sign_in'
    fill_in 'E-mail', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end

  it 'user should be logged' do
    expect(page).to have_content user.email
    expect(::EacUsersSupport::User.current_user).not_to be_nil
  end
end

RSpec.shared_context 'when user is anonymous', shared_context: :metadata do
  before do
    click_link('Sair') if ::EacUsersSupport::User.current_user.present?
  end

  it 'user should be not logged' do
    expect(::EacUsersSupport::User.current_user).to be_nil
  end
end
