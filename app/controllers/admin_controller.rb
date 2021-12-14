class AdminController < ApplicationController
  before_action :is_admin?

  def dashboard
  end

  def manage_users
    @users = User.all
  end

  private

  def is_admin?
    if user_signed_in? && current_user.admin
    else
      flash[:notice] = "Not authorized to access this view"
      redirect_to root_path
    end
  end
end
