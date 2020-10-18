# frozen_string_literal: true

require 'aranha/engine'

Rails.application.routes.draw do
  mount ::EacRailsUtils::Engine => '/'
  mount ::EacUsersSupport::Engine => '/'
  mount ::Aranha::Engine => '/aranha'
  mount ::BrRailties::Engine => '/br_railties'

  namespace(:eac_rails_base0) do
    resources(:mailer, include: []) do
      collection do
        get :info
      end
    end
  end
end
