class CommunitiesController < ApplicationController
  before_action :require_community
  before_action :authenticate_user!, only: [:new, :edit]
  skip_before_action :require_community, only: [:new, :create]

  def show # First add association to Posts
    @posts = @community.posts.all
  end

  def new
    @community = Community.new
  end

  def create
    if Community.create(community_params)
      flash[:notice] = "Community has been created!"
      redirect_to root_path
    else
      flash.now[:alert] = "Error occured while creating community"
      render :new
    end
  end

  def edit
  end

  def update
    if @community.update(community_params)
      flash[:notice] = "Community successfully updated!"
      redirect_to community_path(@community.id)
    else
      flash[:alert] = "Error occured while updating community!"
      render :edit
    end
  end

  def destroy
    @community.destroy
    flash[:alert] = "Community successfully deleted!"
    redirect_to root_path
  end

  private

  def community_params
    params.require(:community).permit(:title, :description, :user_id)
  end

  def require_community
    @community = Community.find(params[:id])
  end
end
