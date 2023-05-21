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

  s.add_dependency 'aranha-parsers', '~> 0.18'
  s.add_dependency 'aranha-rails', '~> 0.8', '>= 0.8.4'
  s.add_dependency 'aranha-selenium', '~> 0.5'
  s.add_dependency 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
  s.add_dependency 'br_railties', '~> 0.4', '>= 0.4.8'
  s.add_dependency 'can_can_dry', '~> 0.5', '>= 0.5.5'
  s.add_dependency 'carrierwave', '~> 1.3', '>= 1.3.3'
  s.add_dependency 'coffee-rails', '~> 5.0'
  s.add_dependency 'eac_active_scaffold', '~> 0.2', '>= 0.2.3'
  s.add_dependency 'eac_cli', '~> 0.35'
  s.add_dependency 'eac_rails_gem_support', '~> 0.7'
  s.add_dependency 'eac_rails_utils', '~> 0.17', '>= 0.17.1'
  s.add_dependency 'eac_ruby_utils', '~> 0.116'
  s.add_dependency 'eac_users_support', '~> 0.10', '>= 0.10.1'
  s.add_dependency 'fog-aws', '~> 3.18'
  s.add_dependency 'jbuilder', '~> 2.11', '>= 2.11.5'
  s.add_dependency 'jquery-rails', '~> 4.5', '>= 4.5.1'
  s.add_dependency 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
  s.add_dependency 'launchy', '~> 2.5', '>= 2.5.2'
  s.add_dependency 'letter_opener', '~> 1.8', '>= 1.8.1'
  s.add_dependency 'listen', '~> 3.8'
  s.add_dependency 'premailer-rails', '~> 1.12'
  s.add_dependency 'puma', '~> 5.6', '>= 5.6.5'
  s.add_dependency 'rails', '~> 5.2.8', '>= 5.2.8.1'
  s.add_dependency 'rails-i18n', '~> 5.1', '>= 5.1.3'
  s.add_dependency 'recordselect', '~> 3.10', '>= 3.10.4'
  s.add_dependency 'sass-rails', '~> 5.1'
  s.add_dependency 'spring', '~> 4.1', '>= 4.1.1'
  s.add_dependency 'tasks_scheduler', '~> 0.6', '>= 0.6.12'
  s.add_dependency 'turbolinks', '~> 5.2', '>= 5.2.1'
  s.add_dependency 'uglifier', '~> 4.2'
  s.add_runtime_dependency 'pg', '~> 0.15'
end
