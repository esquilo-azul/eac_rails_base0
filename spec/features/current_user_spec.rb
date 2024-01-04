# frozen_string_literal: true

RSpec.describe 'Current user', type: :feature do
  ['anonymous', 'non admin', 'admin'].each do |user_type|
    context_title = "when user is #{user_type}"
    context context_title do
      include_context context_title
    end
  end
end
