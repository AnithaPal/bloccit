class SummariesController < ApplicationController


  def new
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @summary = Summary.new
    authorize @summary
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @summary = current_user.summaries.build(params.require(:summary).permit(:body))

    authorize @summary
    if @summary.save
      flash[:notice] = "Summary was saved"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was problem in saving summary. Please try again" 
      render :new 
    end  
  end  

  def show
    @summary = Summary.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @post = posts.find(params[:post_id])  
  end

  
end
