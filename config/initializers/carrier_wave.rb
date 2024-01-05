# frozen_string_literal: true

require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'fog/aws'

if ENV['carrierwave_provider'] == 'AWS'
  CarrierWave.configure do |config|
    config.fog_credentials = {
      aws_access_key_id: ENV.fetch('carrierwave_aws_access_key_id', nil),
      aws_secret_access_key: ENV.fetch('carrierwave_aws_secret_access_key', nil),
      provider: ENV['carrierwave_provider'],
      region: ENV.fetch('carrierwave_aws_region', nil)
    }
    config.fog_directory = ENV.fetch('carrierwave_fog_directory', nil)
    config.fog_public = true
  end
end
