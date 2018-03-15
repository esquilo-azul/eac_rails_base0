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
end
