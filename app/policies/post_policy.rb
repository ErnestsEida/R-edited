class PostPolicy < ApplicationPolicy
  def edit?
    owner?
  end

  def destroy?
    owner?
  end

  def new?
    record.user == user && user.present?
  end

  def destroy?
    owner?
  end

  def edit?
    owner?
  end
end
