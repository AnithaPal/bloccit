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
      render :edit
    end    

  end  

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:notice] = "Your question has been deleted."
      redirect_to @question
    else
      flash[:error] = "Sorry. There was a problem deleting your question. Please try again"
      render :index
    end
  end  
end
