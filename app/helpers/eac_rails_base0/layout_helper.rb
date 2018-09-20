# frozen_string_literal: true

module EacRailsBase0
  module LayoutHelper
    APP_TITLE_METHOD = 'app_title'
    APP_MAIN_MENU_ENTRIES_METHOD = 'app_main_menu_entries'

    def base0_app_title
      if respond_to?(APP_TITLE_METHOD)
        send(APP_TITLE_METHOD)
      else
        "Implement the helper method \"#{APP_TITLE_METHOD}\""
      end
    end

    def base0_app_main_menu_entries
      if respond_to?(APP_MAIN_MENU_ENTRIES_METHOD)
        send(APP_MAIN_MENU_ENTRIES_METHOD, base0_app_main_menu_default_entries)
      else
        base0_app_main_menu_default_entries
      end
    end

    def base0_app_main_menu_default_entries
      {
        'Administração' => {
          ::EacUsersSupport::User.model_name.human(count: 2) =>
            [eac_users_support.admin_users_path],
          'Conteúdo remoto' =>  {
            ::Aranha::Address.model_name.human(count: 2) => [aranha.addresses_path]
          }
        }
      }
    end
  end
end
