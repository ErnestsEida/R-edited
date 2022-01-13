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
    @feedback = Feedback.new
  end

  def token_packs
    @token_packs = TokenPack.all.order(:price)
    @token_pack = TokenPack.new
  end

  private

  def authorize_user
    authorize :admin
  end

end
