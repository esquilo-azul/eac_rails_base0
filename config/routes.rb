# frozen_string_literal: true

require 'aranha/engine'

Rails.application.routes.draw do
  mount ::EacRailsUtils::Engine => '/'
  mount ::EacUsersSupport::Engine => '/'
  mount ::Aranha::Engine => '/aranha'
  mount ::BrRailties::Engine => '/br_railties'

  namespace(:eac_rails_base0) do
    resources(:mailer, only: []) do
      collection do
        get :info
        get :send_test
      end
    end
  end

  post '/eac_rails_base0/mailer/send_test', to: 'eac_rails_base0/mailer#send_test_submit'
end
