# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'eac_rails_base0/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'eac_rails_base0'
  s.version     = ::EacRailsBase0::VERSION
  s.authors     = ['Esquilo Azul Company']
  s.homepage    = 'https://github.com/esquilo-azul/eac_rails_base0'
  s.summary     = 'A Rails base for multiple Rails projects developed by Esquilo Azul Company.'
  s.license     = 'MIT'
  s.metadata    = { 'source_code_uri' => 'https://github.com/esquilo-azul/eac_rails_base0' }

  s.files = Dir['{app,config,exe,lib}/**/*', 'Gemfile', 'README.rdoc']
  s.bindir = 'exe'
  s.executables = s.files.grep(%r{^exe/}) { |f| File.basename(f) }

  s.add_dependency 'aranha', '~> 0.12', '>= 0.12.1'
  s.add_dependency 'bootstrap-sass', '~> 3.4.1'
  s.add_dependency 'br_railties', '~> 0.4', '>= 0.4.1'
  s.add_dependency 'byebug' # Development
  s.add_dependency 'can_can_dry', '~> 0.3', '>= 0.3.1'
  s.add_dependency 'capybara' # Test
  s.add_dependency 'carrierwave', '~> 1.3', '>= 1.3.1'
  s.add_dependency 'coffee-rails', '~> 4.1.0'
  s.add_dependency 'eac_rails_utils', '~> 0.7', '>= 0.7.1'
  s.add_dependency 'eac_ruby_utils', '~> 0.19'
  s.add_dependency 'eac_users_support', '~> 0.4'
  s.add_dependency 'factory_bot_rails', '~> 4.0' # Test
  s.add_dependency 'fog-aws', '~> 3.5', '>= 3.5.2'
  s.add_dependency 'jbuilder', '~> 2.0'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'jquery-ui-rails'
  s.add_dependency 'rails', '~> 4.2.11', '>= 4.2.11.1'
  s.add_dependency 'rails-i18n', '~> 4.0'
  s.add_dependency 'rspec-rails', '~> 3.7' # Test
  s.add_dependency 'rubocop' # Development
  s.add_dependency 'sass-rails', '~> 5.0'
  s.add_dependency 'spring' # Development
  s.add_dependency 'tasks_scheduler', '~> 0.2', '>= 0.2.3'
  s.add_dependency 'therubyracer'
  s.add_dependency 'turbolinks'
  s.add_dependency 'uglifier', '>= 1.3.0'
  s.add_dependency 'web-console', '~> 2.0' # Development
  s.add_runtime_dependency 'pg', '~> 0.15'
  s.add_runtime_dependency 'rails_12factor' # Production
end
