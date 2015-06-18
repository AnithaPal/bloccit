class SummariesController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @summary = Summary.new

  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @summary = Summary.new(params.require(:summary).permit(:description))
    if @summary.save
      flash[:notice] = "Summary is saved successfully"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There is a problem in saving a summary. Please try again"  
      render :new
    end  

  end  

  def show
    @summary = Summary.find(params[:id])
    @post = @topic.posts.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
  end
end
