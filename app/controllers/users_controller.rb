class UsersController < ApplicationController
  before_action :require_user
  skip_before_action :verify_authenticity_token, only: [:update_avatar]

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
    avatar = @user.avatar
    avatar_json = {
      hat: { hatType: avatar.hat_type, hatSize: avatar.hat_size.to_s, hatColor: avatar.hat_color },
      face: { faceType: avatar.face_type, faceColor: avatar.face_color, faceSize: avatar.face_size.to_s },
      shirt: { shirtOn: avatar.shirt_on, shirtColor: avatar.shirt_color }
    }
    render json: avatar_json
  end

  def update_avatar
    hat = params[:hat]
    face = params[:face]
    shirt = params[:shirt]
    @user.avatar.update(hat_type: hat[:hatType], hat_size: hat[:hatSize], hat_color: hat[:hatColor], face_type: face[:faceType], face_size: face[:faceSize], face_color: face[:faceColor], shirt_on: shirt[:shirtOn], shirt_color: shirt[:shirtColor])
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
