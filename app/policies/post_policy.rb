class PostPolicy < ApplicationPolicy
  def owner?
    user == record.user
  end
end
