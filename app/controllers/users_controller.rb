class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Account successfully deleted!"
    redirect_to root_path
  end

  def update
    @user = User.find(params[:id])
    @email = params[:user][:email]
    if @user.email != @email
      if @user.update(email: @email)
        flash[:notice] = "Email confirmation message has been sent to your current email"
        redirect_to root_path
      else
        flash.now[:alert] = "Incorrect email was entered"
        render :edit
      end
    else
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:email)
    end

end
