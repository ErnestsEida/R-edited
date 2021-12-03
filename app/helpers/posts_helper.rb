module PostsHelper
  def is_current_user_owner?(post)
    user_signed_in? && current_user.id == post.user_id
  end
end
