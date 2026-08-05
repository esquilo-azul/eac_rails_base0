# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'eac_rails_base0/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'eac_rails_base0'
  s.version     = EacRailsBase0::VERSION
  s.authors     = ['Esquilo Azul Company']
  s.homepage    = 'https://github.com/esquilo-azul/eac_rails_base0'
  s.summary     = 'A Rails base for multiple Rails projects developed by Esquilo Azul Company.'
  s.license     = 'MIT'
  s.metadata    = { 'source_code_uri' => 'https://github.com/esquilo-azul/eac_rails_base0' }

  s.files = Dir['{app,config,lib}/**/*', 'Gemfile', 'README.rdoc']
  s.bindir = 'exe'
  s.executables = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.required_ruby_version = '>= 3.2'

  s.add_dependency 'aranha-parsers', '~> 0.29'
  s.add_dependency 'aranha-rails', '~> 0.11', '>= 0.11.2'
  s.add_dependency 'aranha-selenium', '~> 0.14', '>= 0.14.1'
  s.add_dependency 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
  s.add_dependency 'br_railties', '~> 0.6', '>= 0.6.2'
  s.add_dependency 'can_can_dry', '~> 0.5', '>= 0.5.7'
  s.add_dependency 'carrierwave', '~> 1.3', '>= 1.3.4'
  s.add_dependency 'coffee-rails', '~> 5.0'
  s.add_dependency 'eac_active_scaffold', '~> 0.8', '>= 0.8.1'
  s.add_dependency 'eac_cli', '~> 0.47', '>= 0.47.1'
  s.add_dependency 'eac_fs', '~> 0.20', '>= 0.20.3'
  s.add_dependency 'eac_rails_delayed_job', '~> 0.3', '>= 0.3.1'
  s.add_dependency 'eac_rails_gem_support', '~> 0.13', '>= 0.13.3'
  s.add_dependency 'eac_rails_remotes', '~> 0.5', '>= 0.5.3'
  s.add_dependency 'eac_rails_utils', '~> 0.29', '>= 0.29.6'
  s.add_dependency 'eac_ruby_utils', '~> 0.132'
  s.add_dependency 'eac_users_support', '~> 0.11', '>= 0.11.4'
  s.add_dependency 'fog-aws', '~> 3.33', '>= 3.33.2'
  s.add_dependency 'jbuilder', '~> 2.15', '>= 2.15.1'
  s.add_dependency 'jquery-rails', '~> 4.6', '>= 4.6.1'
  s.add_dependency 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
  s.add_dependency 'launchy', '~> 2.5', '>= 2.5.2'
  s.add_dependency 'letter_opener', '~> 1.10'
  s.add_dependency 'listen', '~> 3.10'
  s.add_dependency 'pg', '~> 1.6', '>= 1.6.3'
  s.add_dependency 'premailer-rails', '~> 1.12'
  s.add_dependency 'puma', '~> 5.6', '>= 5.6.9'
  s.add_dependency 'rails', '~> 7.2.3', '>= 7.2.3.2'
  s.add_dependency 'rails-i18n', '~> 7.0', '>= 7.0.10'
  s.add_dependency 'recordselect', '~> 3.10', '>= 3.10.9'
  s.add_dependency 'sass-rails', '~> 5.1'
  s.add_dependency 'spring', '~> 4.7'
  s.add_dependency 'tasks_scheduler', '~> 0.11', '>= 0.11.1'
  s.add_dependency 'terser', '~> 1.2'
  s.add_dependency 'turbolinks', '~> 5.2', '>= 5.2.1'
end
