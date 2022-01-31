class HomepagesController < ApplicationController
  before_action :load_homepage

  def index
    cookies[:user] = current_user.id if user_signed_in? && cookies[:user] === nil
    @communities = Community.all
    @token_packs = TokenPack.all.order(:price)
    @feedbacks = Feedback.all
  end

  def create
    params[:files].each do |file|
      @homepage.carousel_images.attach(file)
    end
  end

  def destroy
    @homepage.carousel_images.find(params[:id]).destroy
    redirect_to admin_homepage_path
  end

  private

  def load_homepage
    @homepage = Homepage.first
  end
end
