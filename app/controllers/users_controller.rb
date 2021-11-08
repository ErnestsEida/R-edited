class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def destroy
    User.destroy(params[:id])
    flash[:notice] = "Account successfully deleted!"
    redirect_to root_path
  end

  def update
    @user = User.find(params[:id])
    @data = params[:user]
    if @data != nil and @data[:email] != @user.email
      @user.email = @data[:email]

      if @user.save
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
