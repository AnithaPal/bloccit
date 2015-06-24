class CommentsController < ApplicationController
  

  def create

    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    #@comment.post = @post
    #@comment.user= current_user
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "Comment was saved"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving a comment. Please try again"  
      redirect_to [@topic, @post]
    end
  end


  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was deleted"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error deleting a comment. please try again"  
      redirect_to [@topic, @post]
    end  


  end  
  
  private 

  def comment_params
    params.require(:comment).permit(:body)
  end   

end
