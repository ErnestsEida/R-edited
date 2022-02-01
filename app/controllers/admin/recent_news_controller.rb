class Admin::RecentNewsController < ApplicationController
  def create
    @recent_news = RecentNews.new(recent_news_params)
    if @recent_news.save
      flash[:notice] = "Recent news post was created successfully!"
      redirect_to admin_recent_news_path
    else
      flash.now[:alert] = "Recent news post occured on an error!"
      render admin_recent_news_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def load_recent_news
  end

  def recent_news_params
    params.require(:recent_news).permit(:title, :description, :thumbnail)
  end
end
