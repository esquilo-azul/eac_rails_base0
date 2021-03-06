# frozen_string_literal: true

module EacRailsBase0
  module MainMenuHelper
    APP_MAIN_MENU_ENTRIES_METHOD = 'app_main_menu_entries'
    ADMIN_ENTRIES = %w[eac_users_support tasks_scheduler aranha br_railties mailer].freeze

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
      end.to_h
    end

    def mailer_main_menu_admin_entries
      %w[info send_test].map do |action|
        [
          t("eac_rails_base0.mailer.#{action}"),
          main_app.send("#{action}_eac_rails_base0_mailer_index_path")
        ]
      end.to_h
    end

    def eac_users_support_main_menu_admin_entries
      {
        ::EacUsersSupport::User.model_name.human(count: 2) => [eac_users_support.admin_users_path]
      }
    end

    def tasks_scheduler_main_menu_admin_entries
      {
        t('activerecord.models.scheduled_task.other') => [main_app.status_scheduled_tasks_path]
      }
    end

    def aranha_main_menu_admin_entries
      {
        ::Aranha::Address.model_name.human(count: 2) => [aranha.addresses_path],
        ::Aranha::StartPoint.model_name.human(count: 2) => [aranha.start_points_path]
      }
    end

    def br_railties_main_menu_admin_entries
      {
        ::BrRailties::FederalUnit.model_name.human(count: 2) => [br_railties.federal_units_path],
        ::BrRailties::Municipality.model_name.human(count: 2) => [br_railties.municipalities_path]
      }
    end
  end
end
