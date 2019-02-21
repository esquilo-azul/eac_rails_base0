# frozen_string_literal: true

Rails.application.routes.draw do
  mount ::EacUsersSupport::Engine => '/'
  mount ::Aranha::Engine => '/aranha'
  mount ::BrRailties::Engine => '/br_railties'
end
