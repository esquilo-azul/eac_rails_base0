#!/usr/bin/env ruby
# frozen_string_literal: true

system(
  File.join(File.dirname(__FILE__), 'bundle'),
  'exec', 'rubocop', *ARGV
)
