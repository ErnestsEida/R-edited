class UserMailer < ApplicationMailer
  default from: "no-reply@reedited.com"

  def tokens_recieved
    @user = params[:user]
    @token_amount = params[:amount]
    mail(to: @user.email, subject: "You have recieved tokens on R-Edited")
  end
end
