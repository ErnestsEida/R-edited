class PostsController < ApplicationController
  before_action :require_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :require_policy, only: [:show]

  def new
    @community = Community.find(params[:community_id])
    @post = @community.posts.new(user: current_user)
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = "Post successfully created!"
      redirect_to community_path(post_params[:community_id])
    else
      flash[:alert] = "Error occured while making post!"
      render "posts/new"
    end
  end

  def update
    authorize @post, :owner?
    if @post.update(post_params)
      if params[:post][:remove_banner] == "1"
        @post.banner.purge
      end
      flash.now[:notice] = "Post successfully updated!"
      redirect_to community_post_path(@community.id, @post.id)
    else
      flash.now[:alert] = "Error occured while updating post!"
      render :edit
    end
  end

  def edit
    authorize @post
  end

  def show
    @bookmarked = BookmarkedPost.find_by(user: current_user, post: @post).blank?
    @comment = Comment.new
    @comments = Kaminari.paginate_array(@post.comments.all).page(params[:page]).per(3)
  end

  def destroy
    authorize @post
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
    params.require(:post).permit(:title, :content, :community_id, :tags, :banner)
  end

  def require_post
    @post = Post.find(params[:id])
    @community = Community.find(@post.community_id)
  end

  def require_policy
    @policy = policy(@post)
  end
end
