class CommentPolicy < ApplicationPolicy
  def owner?
    user == record.user
  end
end
