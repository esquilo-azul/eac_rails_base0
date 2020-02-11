# frozen_string_literal: true

require 'carrierwave'

module EacRailsBase0
  class DefaultFileUploader < ::CarrierWave::Uploader::Base
    if ENV['carrierwave_provider'] == 'AWS'
      storage :fog
    else
      storage :file
    end
  end
end
