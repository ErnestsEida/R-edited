class AdminPolicy < ApplicationPolicy
  def dashboard?
    user.admin
  end

  def users?
    user.admin
  end

  def homepage?
    user.admin
  end
end
