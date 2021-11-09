class UsersController < ApplicationController
  before_action :require_user

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user.destroy
    flash[:notice] = "Account successfully deleted!"
    redirect_to root_path
  end

  def update
    if @user.email != params[:user][:email]
      if @user.update(user_params)
        flash[:notice] = "Email confirmation message has been sent to your current email"
        redirect_to root_path
      else
        flash.now[:alert] = "User did not save successfully"
        render :edit
      end
    else
      render :edit
    end
  end

  private

  def require_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email)
  end

end
