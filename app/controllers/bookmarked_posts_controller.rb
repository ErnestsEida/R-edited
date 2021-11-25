class BookmarkedPostsController < ApplicationController
  def index
    @bookmark_ids = BookmarkedPost.where(user: current_user)
    @bookmark_posts = []
    @bookmark_ids.each do |x|
      @bookmark_posts << Post.find(x.post_id)
    end
  end

  def bookmark
    @post = Post.find(params[:bookmarked_post_id])
    @user = current_user
    data = nil
    @bookmark = BookmarkedPost.find_by(user: @user, post: @post)
    if @bookmark != nil
      @bookmark.destroy
      data = { :bookmark => false }
    else
      BookmarkedPost.create(user: @user, post: @post)
      data = { :bookmark => true }
    end
    render :json => data
  end
end
