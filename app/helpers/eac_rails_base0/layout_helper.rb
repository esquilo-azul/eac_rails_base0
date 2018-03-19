# frozen_string_literal: true

module EacRailsBase0
  module LayoutHelper
    APP_TITLE_METHOD = 'app_title'

    def base0_app_title
      if respond_to?(APP_TITLE_METHOD)
        send(APP_TITLE_METHOD)
      else
        "Implement the helper method \"#{APP_TITLE_METHOD}\""
      end
    end
  end
end
