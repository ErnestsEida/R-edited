class PostPolicy < ApplicationPolicy
  def owner?
    user == record.user
  end

  def destroy?
    owner?
  end

  def edit?
    owner?
  end
end
