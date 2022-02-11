class UserMailer < ApplicationMailer
  default from: "no-reply@reedited.com"

  def new_post_in_news
    @user = params[:user]
    @newspost = params[:post]
    mail(to: @user.email, subject: "R-Edited News:#{@newspost.title}")
  end

  def tokens_recieved
    @user = params[:user]
    @token_amount = params[:amount]
    mail(to: @user.email, subject: "You have recieved tokens on R-Edited")
  end
end
