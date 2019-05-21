# frozen_string_literal: true
module EacRailsBase0
  module LinksHelper
    def short_edit_link(object)
      value_or_sign(object, '') do |value|
        link_to '', object_path(value, 'edit'),
                class: 'edit_link', target: '_blank',
                title: ::I18n.t('eac_rails_base0.links.edit_object', label: value.to_s)
      end
    end

    def short_goto_link(url)
      value_or_sign(url, '') do |value|
        link_to '', value, class: 'goto_link', target: '_blank',
                           title: ::I18n.t('eac_rails_base0.links.goto_url', url: value.to_s)
      end
    end

    def object_path(object, action = nil)
      path = "#{object.class.name.underscore.tr('/', '_')}_url"
      path = "#{action}_#{path}" if action.present?
      send(path, object)
    end
  end
end
