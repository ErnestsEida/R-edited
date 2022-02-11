class UsersController < ApplicationController
  before_action :require_user, except: [:fetch_avatar, :update_avatar, :subscribe]
  skip_before_action :verify_authenticity_token, only: [:update_avatar, :subscribe]

  def edit
  end

  def destroy
    @user.destroy
    flash[:notice] = "Account successfully deleted!"
    redirect_to root_path
  end

  def update
      if @user.update(user_params)
        flash.now[:notice] = "Profile updated!"
        render :edit
      else
        flash.now[:alert] = "User did not save successfully"
        render :edit
      end
  end

  def avatar_generator
    authorize @user
  end

  def fetch_avatar
    render json: current_user.avatar_bundle
  end

  def update_avatar
    hat = params[:hat]
    face = params[:face]
    shirt = params[:shirt]
    current_user.update(avatar_bundle: { hat: hat, face: face, shirt: shirt })
  end

  def add_tokens
    token_amount = params[:amount].to_i
    @user.update(tokens: @user.tokens + token_amount)
    UserMailer.with(user: @user, amount: token_amount).tokens_recieved.deliver_now
    render json: { new_token_count: @user.tokens }
  end

  def subscribe
    current_user.update(subscribed_to_news: true)
  end

  private

  def require_user
    if params[:id].present?
      @user = User.find(params[:id])
    else
      @user = User.find(params[:user_id])
    end
  end

  def user_params
    params.require(:user).permit(:email, :username, :nsfw)
  end

end
