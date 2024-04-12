# frozen_string_literal: true

require 'aranha/rails/engine'
require 'bootstrap-sass'
require 'br_railties/engine'
require 'can_can_dry/engine'
require 'eac_active_scaffold/engine'
require 'eac_rails_delayed_job/engine'
require 'eac_rails_remotes/engine'
require 'eac_rails_utils/engine'
require 'eac_rails_utils/engine_helper'
require 'eac_users_support/engine'
require 'rails-i18n'
require 'jquery-rails'
require 'jquery-ui-rails'
require 'tasks_scheduler/engine'
require 'turbolinks'

module EacRailsBase0
  class Engine < ::Rails::Engine
    include ::EacRailsUtils::EngineHelper
  end
end
