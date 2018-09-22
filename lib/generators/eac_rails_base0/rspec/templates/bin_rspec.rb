#!/usr/bin/env ruby
# frozen_string_literal: true

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)
system('bundle', 'exec', 'rspec', *ARGV)
