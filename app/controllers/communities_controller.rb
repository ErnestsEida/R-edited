class CommunitiesController < ApplicationController
  before_action :require_community, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def show
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
    if @community.destroy
      flash[:notice] = "Community successfully deleted!"
      redirect_to root_path
    else
      flash[:alert] = "Error occured on deletion!"
      redirect_to community_path(@community.id)
    end
  end

  private

  def community_params
    params.require(:community).permit(:title, :description, :user_id)
  end

  def require_community
    @community = Community.find(params[:id])
  end
end
