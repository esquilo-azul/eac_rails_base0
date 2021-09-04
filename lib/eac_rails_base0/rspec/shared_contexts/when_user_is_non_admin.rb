# frozen_string_literal: true

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
