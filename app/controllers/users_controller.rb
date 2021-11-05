class UsersController < ApplicationController
  def edit
    @user = current_user
    @data = params[:user]
    if(@data != nil)
      @new_email = @data["new_email"]
      if(!@new_email.to_s.empty?)
        @user.email = @new_email
        @user.save
        flash[:notice] = "Email has been sent to confirm email change!"
      end
    end
  end

  def destroy
    User.destroy(params[:id])
    flash[:notice] = "Account successfully deleted!"
    redirect_to root_path
  end
end
