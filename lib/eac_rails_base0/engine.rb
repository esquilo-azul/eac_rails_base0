# frozen_string_literal: true

require 'aranha/rails/engine'
require 'br_railties/engine'
require 'bootstrap-sass'
require 'can_can_dry'
require 'can_can_dry/engine'
require 'eac_active_scaffold/engine'
require 'eac_rails_base0/engine'
require 'eac_rails_delayed_job/engine'
require 'eac_rails_remotes/engine'
require 'eac_rails_utils/engine'
require 'eac_rails_utils/engine_helper'
require 'eac_users_support/engine'
require 'jquery-rails'
require 'jquery-ui-rails'
require 'rails-i18n'
require 'sass-rails'
require 'tasks_scheduler/engine'
require 'turbolinks'

# require 'eac_rails_utils'
# require 'eac_ruby_utils/core_ext'
# require 'eac_users_support'
# require 'tasks_scheduler'
# require 'br_railties'

require_dependency 'eac_rails_base0/app_base/ability_mapping'
require_dependency 'eac_rails_base0/app_base/ability'
require_dependency 'eac_rails_base0/patches/url_for_patch'
require_dependency 'eac_rails_base0/x_engine'

module EacRailsBase0
  class Engine < ::Rails::Engine
    include ::EacRailsUtils::EngineHelper
  end
end
