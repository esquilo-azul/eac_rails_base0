# frozen_string_literal: true

module EacRailsBase0
  module UserMenuHelper
    # @return [Hash]
    def base0_user_menu_entries
      r = {}
      return base0_user_menu_entries_logged if current_user

      r[t('devise.log_in')] = [eac_users_support.new_user_session_path]
      r
    end

    private

    # @return [Hash]
    def base0_user_menu_entries_logged
      {
        current_user.to_s => {
          'Alterar senha' => [eac_users_support.edit_user_registration_path]
        },
        t('devise.log_out') => [eac_users_support.destroy_user_session_path,
                                { link_method: :delete }]
      }
    end
  end
end
