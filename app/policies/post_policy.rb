class PostPolicy < ApplicationPolicy
  def edit?
    user == record.user
  end
end
