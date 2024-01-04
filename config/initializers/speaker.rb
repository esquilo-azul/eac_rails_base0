# frozen_string_literal: true

require 'eac_cli/speaker'
require 'eac_ruby_utils/speaker'

unless EacRubyUtils::Speaker.context.optional_current
  EacRubyUtils::Speaker.context.push(EacCli::Speaker.new)
end
