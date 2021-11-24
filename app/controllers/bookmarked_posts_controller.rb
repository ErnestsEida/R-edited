class BookmarkedPostsController < ApplicationController
  def show
    @bookmark_ids = BookmarkedPost.where(user: current_user)
    @bookmark_posts = []
    @bookmark_ids.each do |x|
      @bookmark_posts << Post.find(x.post_id)
    end
  end

  def update
    @post = Post.find(params[:id])
    @user = current_user
    status = 200
    data = nil
    @bookmark = BookmarkedPost.find_by(user: @user, post: @post)
    if @bookmark != nil
      if @bookmark.destroy
        data = { :bookmark => false }
      else
        status = 500
      end
    else
      if BookmarkedPost.create(user: @user, post: @post)
        data = { :bookmark => true }
      else
        status = 500
      end
    end
    render :json => data, status: status
  end
end
