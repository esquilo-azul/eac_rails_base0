# frozen_string_literal: true

::ActiveScaffold.defaults do |conf|
  conf.list.per_page = 100
  conf.security.default_permission = false
end
