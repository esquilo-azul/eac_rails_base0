# frozen_string_literal: true

require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'fog/aws'

if ENV['carrierwave_provider'] == 'AWS'
  CarrierWave.configure do |config|
    config.fog_credentials = {
      aws_access_key_id: ENV['carrierwave_aws_access_key_id'],
      aws_secret_access_key: ENV['carrierwave_aws_secret_access_key'],
      provider: ENV['carrierwave_provider'],
      region: ENV['carrierwave_aws_region']
    }
    config.fog_directory = ENV['carrierwave_fog_directory']
    config.fog_public = true
  end
end
