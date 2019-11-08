# frozen_string_literal: true

require 'aranha/engine'

Rails.application.routes.draw do
  mount ::EacRailsUtils::Engine => '/'
  mount ::EacUsersSupport::Engine => '/'
  mount ::Aranha::Engine => '/aranha'
  mount ::BrRailties::Engine => '/br_railties'
end
