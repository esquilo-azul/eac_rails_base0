# frozen_string_literal: true

Rails.application.routes.draw do
  mount ::EacRailsUtils::Engine => '/'
  mount ::EacUsersSupport::Engine => '/'
  mount ::Aranha::Engine => '/aranha'
  mount ::BrRailties::Engine => '/br_railties'
end
