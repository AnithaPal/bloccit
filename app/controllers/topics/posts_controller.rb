  class Topics::PostsController < ApplicationController
  # Post Index is removed becasue it is nested inside topic
  # def index
  #   @posts = Post.all
  #   authorize @posts
  # end 

  def show
    @topic = Topic.find(params[:topic_id])
    authorize @topic 
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new    
    authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)
    @post.topic = @topic
    authorize @post
    if @post.save
       @post.create_vote
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again" 
      render :new 
    end  
  end  

  
  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
    # if @post.comments?
    #   authorize @comment
    # end  
  end
 
  def update
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     authorize @post
     #authrize @comment
     if @post.update_attributes(post_params)
       flash[:notice] = "Post was updated."
       redirect_to [@topic, @post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post

    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully"
      redirect_to @topic
    else
      flash[:error] = "There was an error deleting the post. Please try again."  
      redirect_to topic_show_path
    end
  end    



  private
  def post_params
    params.require(:post).permit(:title, :body, :image)
  end  



end
  