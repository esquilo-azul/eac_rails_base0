# frozen_string_literal: true

module EacRailsBase0
  module AppVersionHelper
    def base0_app_version
      base0_app_version_by_environment_variable ||
        base0_app_version_by_version_file ||
        ::I18n.t('eac_rails_base0.app_version.unsetted')
    end

    def base0_app_version_by_environment_variable
      ENV['APP_VERSION'].to_s.strip.presence
    end

    def base0_app_version_by_version_file
      ::Rails.root.children.find { |file| file.basename.to_path.downcase == 'version' }
             .if_present { |file| file.read.presence }
    end
  end
end
