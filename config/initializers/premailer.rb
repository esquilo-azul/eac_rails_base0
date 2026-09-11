# frozen_string_literal: true

require 'premailer'

class Premailer
  class << self
    alias old_media_query? media_query?

    def media_query?(media_types)
      Array(media_types).include?(:print) || old_media_query?(media_types)
    end
  end
end

require 'premailer/rails'
Premailer::Rails.config.merge!(remove_classes: true, remove_ids: true,
                               drop_unmergeable_css_rules: true)
