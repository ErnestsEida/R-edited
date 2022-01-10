class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :admin?

  def dashboard
  end

  def users
    @users = User.all
  end

  private

  def admin?
    authorize current_user, :admin?
  end

end
