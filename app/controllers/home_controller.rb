class HomeController < ApplicationController
  before_action :load_homepage

  def index
    @communities = Community.all.order(:title)
  end

  def create
    params[:files].each do |file|
      @homepage.carousel_images.attach(file)
    end
  end

  def destroy
    @homepage.carousel_images.find(params[:id]).destroy
    redirect_to admin_manage_homepage_path
  end

  private

  def load_homepage
    @homepage = Home.first
  end
end
