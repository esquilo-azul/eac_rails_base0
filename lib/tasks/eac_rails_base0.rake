namespace :eac_rails_base0 do
  desc 'Remove all temporary files.'
  task clear: ['db:schema:cache:clear', 'log:clear', 'tmp:clear', 'assets:clobber'] do
  end
end
