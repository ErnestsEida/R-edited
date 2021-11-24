class PostPolicy < ApplicationPolicy
  def edit?
    owner?
  end

  def destroy?
    owner?
  end

  def new?
    record.community.closed == false && record.user == user && user.present?
  end
end
