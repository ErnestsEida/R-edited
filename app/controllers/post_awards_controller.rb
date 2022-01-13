class PostAwardsController < ApplicationController
  def reward
    award = Award.find(params[:award_id])
    bought = false
    if current_user.tokens >= award.value
      user_tokens = current_user.tokens - award.value
      current_user.update(tokens: user_tokens)
      PostAward.create(user: current_user, award_id: params[:award_id], post_id: params[:post_id])
      bought = true
    end
    render json: { bought: bought }
  end
end
