class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? || user.moderator?
        scope.all
      elsif  user.member?
        scope.where(user_id:  user.id)
      else
        scope.none  
      end
    end
  end         

  def index?
    true
  end

# def update?
#     user.admin? or not post.published?
# end  


 end 