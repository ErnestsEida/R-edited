class PostsController < ApplicationController
  before_action :require_post
  before_action :authenticate_user!, only: [:new, :edit]
  skip_before_action :require_post, only: [:new, :create]

  def new
    @community = Community.find(params[:community_id])
    @post = @community.posts.new
  end

  def create
    if Post.create(post_params)
      flash[:notice] = "Post successfully created!"
      redirect_to community_path(params[:post][:community_id])
    else
      flash.now[:alert] = "Error occured while making post!"
      render :new
    end
  end

  def update
    if @post.update(post_params)
      flash.now[:notice] = "Post successfully updated!"
      redirect_to community_post_path(@community.id, @post.id)
    else
      flash.now[:alert] = "Error occured while updating post!"
      render :edit
    end
  end

  def edit
    @owner = helpers.is_current_user_owner?(@post)
    if !@owner
      flash[:alert] = "Not authorized to edit this post!"
      redirect_to community_path(@community.id)
    end
  end

  def show
    @owner = helpers.is_current_user_owner?(@post)
  end

  def destroy
    @post.destroy
    redirect_to community_path(@community.id)
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
