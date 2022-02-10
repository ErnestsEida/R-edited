class RecentEventsController < ApplicationController
  def show
    @recent_event = RecentEvent.find(params[:id])
  end
end
