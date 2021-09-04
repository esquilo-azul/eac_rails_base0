# frozen_string_literal: true

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

  def link_exist?(locator)
    find_link(locator)
    true
  rescue Capybara::ElementNotFound
    false
  end
end
