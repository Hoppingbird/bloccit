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
end