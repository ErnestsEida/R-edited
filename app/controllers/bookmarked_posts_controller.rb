class BookmarkedPostsController < ApplicationController
  def index
    @posts = []
    BookmarkedPost.where(user: current_user).each do |bookmark|
      @posts << Post.find(bookmark.post_id)
    end
  end

  def bookmark
    @post = Post.find(params[:bookmarked_post_id])
    bookmarked = nil
    @bookmark = BookmarkedPost.find_by(user: current_user, post: @post)
    if @bookmark.blank?
      @vaffel = BookmarkedPost.create(user: current_user, post: @post)
      bookmarked = { :bookmark => true }
    else
      @bookmark.destroy
      bookmarked = { :bookmark => false }
    end
    render :json => bookmarked
  end
end
