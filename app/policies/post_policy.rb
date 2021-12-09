class PostPolicy < ApplicationPolicy
  def moderator?
    Moderator.find_by(user: user, community: record.community).present?
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
