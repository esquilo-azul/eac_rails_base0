# frozen_string_literal: true

module EacRailsBase0
  module MainMenuHelper
    APP_MAIN_MENU_ENTRIES_METHOD = 'app_main_menu_entries'
    ADMIN_ENTRIES = %w[].freeze

    def base0_app_main_menu_entries
      if respond_to?(APP_MAIN_MENU_ENTRIES_METHOD)
        send(APP_MAIN_MENU_ENTRIES_METHOD, base0_app_main_menu_default_entries)
      else
        base0_app_main_menu_default_entries
      end
    end

    def base0_app_main_menu_default_entries
      {
        'Administração' => base0_app_main_menu_admin_entries
      }
    end

    def base0_app_main_menu_admin_entries
      ADMIN_ENTRIES.map do |identifier|
        [::I18n.t("eac_rails_base0.main_menu.admin.#{identifier}"),
         send("#{identifier}_main_menu_admin_entries")]
      end.to_h.merge(base0_app_main_menu_admin_entries_from_application)
    end

    # @return [Hash]
    def base0_app_main_menu_admin_entries_from_application
      ::Rails.application.root_menu.sub(:admin).to_dropdown_menu_entries(self)
    end
  end
end
