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
        'Administração' => base0_app_main_menu_admin_entries
      }
    end

    def base0_app_main_menu_admin_entries
      h = {}
      base0_app_main_menu_admin_gems.each do |gem_module|
        identifier = gem_module.name.underscore
        h[::I18n.t("eac_rails_base0.main_menu.admin.#{identifier}")] =
          send("#{identifier}_main_menu_admin_entries")
      end
      h
    end

    def base0_app_main_menu_admin_gems
      [::EacUsersSupport, ::TasksScheduler, ::Aranha]
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
        ::Aranha::Address.model_name.human(count: 2) => [aranha.addresses_path]
      }
    end
  end
end
