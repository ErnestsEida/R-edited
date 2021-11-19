class PostsController < ApplicationController
  before_action :require_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def new
    @community = Community.find(params[:community_id])
    @post = @community.posts.new
  end

  def create
    if Post.create(post_params)
      flash[:notice] = "Post successfully created!"
      redirect_to community_path(post_params[:community_id])
    else
      flash.now[:alert] = "Error occured while making post!"
      render :new
    end
  end

  def update
    authorize @post, :owner?
    if @post.update(post_params)
      flash.now[:notice] = "Post successfully updated!"
      redirect_to community_post_path(@community.id, @post.id)
    else
      flash.now[:alert] = "Error occured while updating post!"
      render :edit
    end
  end

  def edit
    authorize @post, :owner?
  end

  def show
  end

  def destroy
    authorize @post, :owner?
    if @post.destroy
      flash[:notice] = "Post successfully deleted!"
      redirect_to community_path(@community.id)
    else
      flash[:alert] = "Error occured on deletion!"
      redirect_to edit_community_post_path(@community.id, @post.id)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :community_id)
  end

  def require_post
    @post = Post.find(params[:id])
    @community = Community.find(@post.community_id)
  end
end
