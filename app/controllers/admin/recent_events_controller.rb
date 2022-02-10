class Admin::RecentEventsController < ApplicationController
  before_action :load_recent_event, only: [:edit, :update, :destroy]

  def create
    @recent_event = RecentEvent.new(recent_event_params)
    if @recent_event.save
      flash[:notice] = "Recent news post was created successfully!"
      redirect_to admin_recent_events_path
    else
      render admin_recent_events_path
    end
  end

  def edit
  end

  def update
    if @recent_event.update(recent_event_params)
      flash[:notice] = "Successfully updated a post!"
      redirect_to admin_recent_event_path
    else
      flash[:alert] = "Error occured on post update!"
      redirect_to edit_admin_recent_event_path(@recent_event)
    end
  end

  def destroy
    if @recent_event.destroy
      flash[:notice] = "News post was deleted successfully!"
    else
      flash[:alert] = "Error occured on news post deletion!"
    end
    redirect_to admin_recent_events_path
  end

  private

  def load_recent_event
    @recent_event = RecentEvent.find(params[:id])
  end

  def recent_event_params
    params.require(:recent_event).permit(:title, :description, :thumbnail)
  end
end
