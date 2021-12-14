class CommentPolicy < ApplicationPolicy
  def admin?
    return true if user.admin
  end
end
