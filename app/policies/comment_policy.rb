class CommentPolicy < ApplicationPolicy
  def owner?
    user.id == record.user.id
  end

  def destroy?
    owner?
  end

  def update?
    owner?
  end

  def create?
    record.user != nil
    owner?
  end
end
