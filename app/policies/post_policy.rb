 class PostPolicy < ApplicationPolicy
   
   def index?
    true
   end
   
 class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      user.present? && (record.user == user || user.admin? || user.moderator?)
    end
  
end
   
 end
 
 