class PostPolicy < ApplicationPolicy
  def edit?
    owner?
  end

  def destroy?
    owner?
  end

  def new?
    user != nil
  end
end
