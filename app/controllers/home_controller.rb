class HomeController < ApplicationController
  def index
    @communities = Community.all.order(:title)
  end
end
