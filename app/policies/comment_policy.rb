class CommentPolicy < ApplicationPolicy
  def owner?
    user == record.user
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
