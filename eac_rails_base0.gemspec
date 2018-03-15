# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'eac_rails_base0/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'eac_rails_base0'
  s.version     = ::EacRailsBase0::VERSION
  s.authors     = ['Esquilo Azul Company']
  s.summary     = 'Base padrão para aplicações Rails da Esquilo Azul Company.'
  s.license     = 'MIT'

  s.files = Dir['{lib}/**/*']

  s.add_dependency 'byebug' # Development
  s.add_dependency 'coffee-rails', '~> 4.1.0'
  s.add_dependency 'jbuilder', '~> 2.0'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'rails', '~> 4.2.10'
  s.add_dependency 'rubocop' # Development
  s.add_dependency 'sass-rails', '~> 5.0'
  s.add_dependency 'spring' # Development
  s.add_dependency 'therubyracer'
  s.add_dependency 'turbolinks'
  s.add_dependency 'uglifier', '>= 1.3.0'
  s.add_dependency 'web-console', '~> 2.0' # Development
end
