class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @qustion = Question.new
  end

  def create
    @question = Question.new(params.require(:question).permit(:title, :body, :resolved))
    if @question.save
      flash[:notice] = "Question was saved"
      redirect_ to @question
    else
      flash[:error] = "There was an error saving the question. Please try again"  
      render :new
    end
  end    
        

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @post.update_attributes(params.require(:question).pemit(:title, :body, :resolved))
      flash[:notice] = "Question was updated"
      redirect_to @question
    else
      flash[:error] = "There was an error updating the question. Please try again"
    end    

  end  
end
