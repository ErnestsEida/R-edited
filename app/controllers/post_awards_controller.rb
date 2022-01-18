class PostAwardsController < ApplicationController
  def reward
    award = Award.find(params[:award_id])
    bought = current_user.purchase(award)
    if bought
      PostAward.create(user: current_user, award_id: params[:award_id], post_id: params[:post_id])
    end
    render json: { bought: bought }
  end
end
