class PostAwardsController < ApplicationController
  def reward
    success = current_user.purchase(params[:award_id]) && Post.find(params[:post_id]).reward(current_user, params[:award_id])
    render json: { bought: success }
  end
end
