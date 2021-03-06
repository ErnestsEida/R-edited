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

  def token_packs?
    user.admin
  end

  def awards?
    user.admin
  end

  def recent_events?
    user.admin
  end
end
