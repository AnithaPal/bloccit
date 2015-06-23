class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create

    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = @current_user.id
    if @comment.save
      flash[:notice] = "Comment was saved"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving a comment. Please try again"  
      render :new
    end
  end
  
  private 

  def comment_params
    params.require(:comment).permit(:body)
  end   
   
end
