class FeedbacksController < ApplicationController
  before_action :is_admin?
  before_action :require_feedback, only: [:edit, :update, :destroy]

  def create
    feedback = Feedback.new(feedback_params)
    if feedback.save
      flash[:notice] = "Feedback created successfully!"
      redirect_to admin_manage_homepage_path
    else
      flash[:alert] = "Error occured on feedback creation!"
      redirect_to admin_manage_homepage_path
    end
  end

  def edit
  end

  def update
    if @feedback.update(feedback_params)
      flash[:notice] = "Feedback successfully updated!"
      redirect_to edit_feedback_path(@feedback)
    else
      flash[:alert] = "Error occured on feedback update!"
      redirect_to edit_feedback_path(@feedback)
    end
  end

  def destroy
    if @feedback.destroy
      flash[:notice] = "Feedback successfully removed!"
      redirect_to admin_manage_homepage_path
    else
      flash[:alert] = "Error occured when removing feedback!"
      redirect_to admin_manage_homepage_path
    end
  end

  private

  def require_feedback
    @feedback = Feedback.find(params[:id])
  end

  def feedback_params
    params.require(:feedback).permit(:header, :description, :image)
  end
end
