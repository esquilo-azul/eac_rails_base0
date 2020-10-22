# frozen_string_literal: true

module EacRailsBase0
  module UserMenuHelper
    def base0_user_menu_entries
      r = {}
      if current_user
        r[current_user.to_s] = [main_app.root_path]
        r['Sair'] = [eac_users_support.destroy_user_session_path, link_method: :delete]
      else
        r['Entrar'] = [eac_users_support.new_user_session_path]
      end
      r
    end
  end
end
