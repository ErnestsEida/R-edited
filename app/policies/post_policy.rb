class PostPolicy < ApplicationPolicy
  def moderator?
    record.community.moderators.all.each do |moderator|
      if moderator.user == user
        return true
      end
    end

    return false
  end

  def edit?
    owner?
  end

  def new?
    record.community.closed == false && record.user == user && user.present?
  end

  def destroy?
    owner? || moderator? || record.community.user == user
  end

  def edit?
    owner?
  end
end
