class AdminController < ApplicationController
  before_action :authenticate_user!, :authorize_user
  after_action :verify_authorized

  def dashboard
  end

  def users
    @users = User.all
  end

  def homepage
    @homepage = Homepage.first
  end

  private

  def authorize_user
    authorize :admin
  end

end
