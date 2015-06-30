class CommentsController < ApplicationController
  

  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    @comment = current_user.comments.build( comment_params )
    @comment.post = @post
    @new_comment = Comment.new

    if @comment.save
      flash[:notice] = "Comment created successfully"
    else
      flash[:error] = "There was an error creating your comment, please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    # @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was deleted"
    else
      flash[:error] = "There was an error deleting a comment. please try again"  
    end  

    respond_to do |format|
      format.html
      format.js
    end  

  end  
  
  private 

  def comment_params
    params.require(:comment).permit(:body)
  end   

end
