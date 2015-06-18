class SummariesController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    # @post = @topic.posts.find(params[:post_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new

  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new(params.require(:summary).permit(:description))
    @summary.post = @post

    if @summary.save!
      flash[:notice] = "Summary is saved successfully"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There is a problem in saving a summary. Please try again"  
      render :new
    end  

  end  

  def show
    # @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = @post.summary
  end
end
