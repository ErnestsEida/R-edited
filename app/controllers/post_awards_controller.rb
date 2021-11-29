class PostAwardsController < ApplicationController
  def reward
    PostAward.create(user: current_user, award_id: params[:award_id], post_id: params[:post_id])
  end
end
