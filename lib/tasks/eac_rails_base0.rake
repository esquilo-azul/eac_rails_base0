require 'rspec/core/rake_task'

namespace :eac_rails_base0 do
  desc 'Remove all temporary files.'
  task clear: ['db:schema:cache:clear', 'log:clear', 'tmp:clear', 'assets:clobber'] do
  end

  ::RSpec::Core::RakeTask.new(:rspec) do |t|
    t.rspec_opts = "--pattern '**/spec/**/*_spec.rb'"
  end
  Rake::Task['eac_rails_base0:rspec'].enhance ['db:test:prepare']
end
