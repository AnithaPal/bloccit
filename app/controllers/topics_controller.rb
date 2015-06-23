class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    authorize @topics
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def show
     @topic = Topic.find(params[:id])
     @posts = @topic.posts
     authorize @topic
   end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def create
    
    @topic = Topic.new(topics_params)
    authorize @topic
    if @topic.save
      redirect_to @topic, notice: 'Topic was saved successfully.'
    else
    flash[:error] = "Error creating a topic. Try again"
    render :new
    end  
  end 

  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update_attributes(topics_params)
      redirect_to @topic, notice: 'Topic was updated successfully'
    else 
      flash[:error] = 'Error updating a topic. Try again'
    end  
  end 

  private

  def topics_params
    params.require(:topic).permit(:name, :description, :public)
  end  

end