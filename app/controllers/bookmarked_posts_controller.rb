class BookmarkedPostsController < ApplicationController
  def index
    @posts = Post.joins(:bookmarked_posts).where(bookmarked_posts: { user_id: current_user.id })
  end

  def bookmark
    bookmarked = false
    bookmark = BookmarkedPost.find_by(user: current_user, post_id: params[:bookmarked_post_id])

    if bookmark.blank?
      BookmarkedPost.create(user: current_user, post_id: params[:bookmarked_post_id])
      bookmarked = true
    else
      bookmark.destroy
    end

    render json: { bookmarked: bookmarked }
  end
end
