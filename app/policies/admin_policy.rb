class AdminPolicy < ApplicationPolicy
  def dashboard?
    user.admin
  end

  def users?
    user.admin
  end
end
