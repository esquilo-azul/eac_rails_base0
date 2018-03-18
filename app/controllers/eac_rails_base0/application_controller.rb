# frozen_string_literal: true

module EacRailsBase0
  class ApplicationController < ActionController::Base
    include ::CanCanDry::ControllerAuthorization

    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    before_action :authorize_by_ability_mapping

    rescue_from CanCan::AccessDenied do |exception|
      if current_user
        flash[:error] = "Conteúdo indisponível: #{exception}"
        redirect_to main_app.root_url
      else
        flash[:danger] = 'Por favor faça o login.'
        redirect_to eac_users_support.new_user_session_path
      end
    end
  end
end
