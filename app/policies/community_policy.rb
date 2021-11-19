class CommunityPolicy < ApplicationPolicy
  def update?
    owner?
  end

  def destroy?
    owner?
  end

  def edit?
    owner?
  end
end
