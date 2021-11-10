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

  private

  def require_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :username, :nsfw)
  end

end
