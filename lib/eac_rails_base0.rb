# frozen_string_literal: true

require 'sass-rails'
require 'jquery-rails'
require 'turbolinks'
require 'bootstrap-sass'
require 'can_can_dry'
require 'eac_rails_utils'
require 'eac_users_support'
require 'eac_rails_base0/engine'

module EacRailsBase0
end

require_dependency 'eac_rails_base0/app_base/ability_mapping'
require_dependency 'eac_rails_base0/app_base/ability'
