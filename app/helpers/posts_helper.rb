module PostsHelper
  def is_current_user_owner?
    if user_signed_in?
      if User.find(@post.user_id) == current_user
        return true
      else
        return false
      end
    else
      return false
    end
  end
end
