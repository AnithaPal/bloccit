class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      elsif user.moderator?
        scope.all
      else
        scope.where(:published => true)
      end
    end
  end         

  def index?
    true
  end

  def update?
    user.admin? or not post.published?
  end  
 end 