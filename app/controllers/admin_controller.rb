class AdminController < ApplicationController
  before_action :authenticate_user!, :authorize_user
  after_action :verify_authorized

  def dashboard
  end

  def users
    @users = User.all.where(admin: false).order(:id).page(params[:page]).per(20)
  end

  def homepage
    @homepage = Homepage.first
  end

  def awards
    @awards = Award.all.order(:value)
    @award = Award.new
  end

  private

  def authorize_user
    authorize :admin
  end

end
