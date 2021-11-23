class CommentsController < ApplicationController
  before_action :load_comment, only: [:destroy, :update]
  before_action :authenticate_user!, only: [:create]

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    authorize @comment
    if @comment.save
      redirect_to community_post_path(@post.community.id, @post)
    else
     render 'posts/show'
    end
  end

  def update
    authorize @comment
    if @comment.update(comment_params)
      flash[:notice] = "Successfully updated comment!"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Error occured on comment update!"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment deleted!"
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = "Error occured while deleting comment!"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def load_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
