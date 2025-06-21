# frozen_string_literal: true

require 'eac_ruby_utils'
EacRubyUtils::RootModuleSetup.perform __FILE__ do
  %w[enumerator generators/**/* fog tasks/**/*].each do |basename|
    ignore "#{__dir__}/#{basename}"
  end
  ignore 'app_base/application'
  ignore 'app_base/application/**/*'
  ignore 'patches/**/*'
end

module EacRailsBase0
end

require 'eac_rails_base0/engine'
require 'tasks_scheduler'
