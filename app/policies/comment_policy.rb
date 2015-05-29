class CommentPolicy < ApplicationPolicy
  def new?
    user
  end

  def create?
    new?
  end

  def show?
    new?
  end

  def destroy?
    user.present? && (record.user == user || user.admin? || user.moderator?)
  end
end