class UsersController < ApplicationController
  def edit
    @user = current_user
    @data = params[:user]
    if(@data != nil)
      @new_email = @data["new_email"]
      if(!@new_email.to_s.empty?)
        if(@new_email.match(/[a-zA-Z0-9._%]@(?:[a-zA-Z0-9]+\.)[a-zA-Z]{2,4}/))
          @user.email = @new_email
          @user.save
          flash[:alert] = nil
          flash[:notice] = "Email has been sent to confirm email change!"
        else
          flash[:notice] = nil
          flash[:alert] = "Incorrect email format for new email"
        end
      end
    end
  end

  def destroy
    User.destroy(params[:id])
    flash[:notice] = "Account successfully deleted!"
    redirect_to root_path
  end
end
