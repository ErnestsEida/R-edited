class CommentsController < ApplicationController
  before_action :require_comment, only: [:destroy, :update]

  def create
    if Comment.create(comment_params)
      flash[:notice] = "Comment successfully created!"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Error occured on posting"
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    authorize @comment, :owner?
    if @comment.update(comment_params)
      flash[:notice] = "Successfully updated comment!"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Error occured on comment update!"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    authorize @comment, :owner?
    if @comment.destroy
      flash[:notice] = "Comment deleted!"
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = "Error occured while deleting comment!"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def require_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
