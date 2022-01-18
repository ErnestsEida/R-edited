class UsersController < ApplicationController
  before_action :require_user

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

  def add_tokens
    token_amount = params[:amount].to_i
    new_amount = @user.tokens + token_amount
    @user.update(tokens: new_amount)
    UserMailer.with(user: @user, amount: token_amount).tokens_recieved.deliver_now
    render json: { new_token_count: new_amount }
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
