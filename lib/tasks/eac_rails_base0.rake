# frozen_string_literal: true

require 'rake/testtask'
require 'rspec/core/rake_task'

namespace :eac_rails_base0 do
  desc 'Remove all temporary files.'
  task clear: ['db:schema:cache:clear', 'log:clear', 'tmp:clear', 'assets:clobber'] do
  end

  ::RSpec::Core::RakeTask.new(:rspec) do |t|
    t.rspec_opts = "--pattern '**/spec/**/*_spec.rb'"
  end
  Rake::Task['eac_rails_base0:rspec'].enhance ['db:test:prepare']

  desc 'Minitest for engines'
  ::Rake::TestTask.new('minitest:engines' => 'test:prepare') do |t|
    t.pattern = 'engines/*/test/**/*_test.rb'
  end

  desc 'Minitest for application'
  task minitest: %w[test:run eac_rails_base0:minitest:engines]

  desc 'Minitest and RSpec for application'
  task test: ['test', 'eac_rails_base0:rspec']
end

Rake::Task['default'].clear
task default: %w[eac_rails_base0:gems:test_all]

Rake::Task['test'].clear
task test: %w[eac_rails_base0:minitest]
