# frozen_string_literal: true

::Rails.application.root_menu.group(:admin).group(:email).within do |g|
  %w[info send_test].each do |action|
    g.action("#{action}_eac_rails_base0_mailer_index")
     .label(-> { ::I18n.t("eac_rails_base0.mailer.#{action}") })
  end
end
