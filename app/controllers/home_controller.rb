class HomeController < ApplicationController
  before_action :get_homepage
  def index
    @communities = Community.all
    @token_packs = TokenPack.all
  end

  def carousel_images
    params[:files].each do |file|
      @homepage.carousel_images.attach(file)
    end
  end

  def destroy_carousel_image
    @homepage.carousel_images.find(params[:id]).destroy
    redirect_to admin_manage_homepage_path
  end

  private

  def get_homepage
    @homepage = Home.first
  end
end
