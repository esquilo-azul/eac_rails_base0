# frozen_string_literal: true

module EacRailsBase0
  module MainMenuHelper
    APP_MAIN_MENU_ENTRIES_METHOD = 'app_main_menu_entries'

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
      ::Rails.application.root_menu.sub(:admin).to_dropdown_menu_entries(self)
    end
  end
end
