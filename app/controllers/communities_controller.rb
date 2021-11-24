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
    authorize @community, :owner?
  end

  def update
    authorize @community, :owner?
    if @community.update(community_params)
      flash[:notice] = "Community successfully updated!"
      redirect_to community_path(@community.id)
    else
      flash[:alert] = "Error occured while updating community!"
      render :edit
    end
  end

  def destroy
    authorize @community, :owner?
    if @community.update(closed: true, closed_at: DateTime.now)
      flash[:notice] = "Community successfully closed!"
      redirect_to community_path(@community.id)
    else
      flash[:alert] = "Error occured on closure!"
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
