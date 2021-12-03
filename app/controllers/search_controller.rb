class SearchController < ApplicationController
  def show
    @query = params[:query]
    @users = @posts = @communities = []
    if @query.blank?
      @users = User.where("lower(username) LIKE ?", "%#{@query.downcase}%")
      @posts = Post.where("lower(title) LIKE ?", "%#{@query.downcase}%")
      @communities = Community.where("lower(title) LIKE ?", "%#{@query.downcase}%")
    end
  end
end
