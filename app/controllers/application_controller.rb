class ApplicationController < ActionController::Base
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError do
    flash[:alert] = "Not authorized!"
    redirect_to root_path
  end

  protected

  def is_admin?
    if user_signed_in? && current_user.admin
    else
      flash[:notice] = "Not authorized to access this view"
      redirect_to root_path
    end
  end

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password])
  end
end
