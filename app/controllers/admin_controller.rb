class AdminController < ApplicationController
  before_action :is_admin?

  def dashboard
  end

  def manage_users
    @users = User.all
  end

  def manage_homepage
    @homepage = Home.first
    @feedback = Feedback.new
  end

  def manage_token_packs
    @token_packs = TokenPack.all
    @token_pack = TokenPack.new
  end

end
