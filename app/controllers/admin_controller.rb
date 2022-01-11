class AdminController < ApplicationController
  before_action :authenticate_user!, :authorize_user
  after_action :verify_authorized

  def dashboard
  end

  def users
    @users = User.all
  end

  def manage_homepage
    @homepage = Home.first
  end

  private

  def authorize_user
    authorize :admin
  end

end
