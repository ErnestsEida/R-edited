class PostsController < ApplicationController
  before_action :require_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

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
    params.require(:post).permit(:title, :content, :community_id, :tags)
  end

  def require_post
    @post = Post.find(params[:id])
    @community = Community.find(@post.community_id)
  end

  def add_tags(post, tags_json)
    tags_params = JSON.parse(tags_json)
    tags_params.each do |tag_param|
      tag = Tag.find_or_create_by(title: tag_param['value'])
      post.tag_references.create(tag: tag)
    end
  end
end
