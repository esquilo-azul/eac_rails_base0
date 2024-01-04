# frozen_string_literal: true

require 'premailer'

class Premailer
  class << self
    alias old_is_media_query? is_media_query?

    def is_media_query?(media_types) # rubocop:disable Naming/PredicateName
      media_types.include?(:print) || old_is_media_query?(media_types)
    end
  end
end

require 'premailer/rails'
Premailer::Rails.config.merge!(remove_classes: true, remove_ids: true,
                               drop_unmergeable_css_rules: true)
