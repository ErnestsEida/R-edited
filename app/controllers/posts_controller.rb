class PostsController < ApplicationController
  before_action :require_post
  skip_before_action :require_post, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    if Post.create(post_params)
      flash[:notice] = "Post successfully created!"
      redirect_to new_post_path
    else
      flash.now[:alert] = "Error occured while making post!"
      render :new
    end
  end

  def update
    if @post.update(post_params)
      flash.now[:notice] = "Post successfully updated!"
      render :edit
    else
      flash.now[:alert] = "Error occured while updating post!"
      render :edit
    end
  end

  def edit
    @owner = helpers.is_current_user_owner?
    if !@owner
      flash[:alert] = "Not authorized to edit this post!"
      redirect_to root_path
    end
  end

  def show
    @owner = helpers.is_current_user_owner?
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

  def require_post
    @post = Post.find(params[:id])
  end
end
