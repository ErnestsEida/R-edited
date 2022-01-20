class UserPolicy < ApplicationPolicy
  def avatar_generator?
    record == user
  end
end
