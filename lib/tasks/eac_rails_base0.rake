# frozen_string_literal: true

require 'rake/testtask'
require 'rspec/core/rake_task'

namespace :eac_rails_base0 do
  desc 'Remove all temporary files.'
  task clear: ['db:schema:cache:clear', 'log:clear', 'tmp:clear', 'assets:clobber'] do
  end

  ::RSpec::Core::RakeTask.new(:rspec) do |t|
    t.rspec_opts =
      "--pattern '{spec,#{::EacRailsBase0::Paths.engines_subpath}/*/spec}/**/*_spec.rb'"
  end
  Rake::Task['eac_rails_base0:rspec'].enhance ['db:test:prepare']

  namespace :minitest do
    { core: '', engines: "#{::EacRailsBase0::Paths.engines_subpath}/*/" }
      .each do |name, pattern_prefix|
      ::Rake::TestTask.new(name => 'test:prepare') do |t|
        t.libs << 'test'
        t.pattern = "#{pattern_prefix}test/**/*_test.rb"
        t.ruby_opts = %w[-W0]
        t.verbose = false
      end
    end
  end

  desc 'Minitest for application and engines'
  task minitest: %w[core engines].map { |task| "eac_rails_base0:minitest:#{task}" }

  desc 'Minitest and RSpec for application'
  task test: ['eac_rails_base0:minitest', 'eac_rails_base0:rspec']
end

Rake::Task['default'].clear
task default: %w[eac_rails_base0:test]

Rake::Task['test'].clear
task test: %w[eac_rails_base0:minitest]
