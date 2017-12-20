class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @questions = Question.find(params[:id])
  end

  def new
    @questions = Question.new
  end
  
  def create
    @question = Question.new(params.require(:question).permit(:title, :body, :resolved))
      if @question.save
        flash[:notice] = "Question was saved"
        redirect_to @question
      else
        flash[:notice] = "There was an error try again"
        render :new
      end
  end

  def edit
    @questions = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params.require(:question).permit(:title, :body, :resolved))
      flash[:notice] = "Question was updated"
      redirect_to @question
    else
      flash[:error] = "There was an error try again"
      render :edit
    end
  end
  
  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:notice] = "Question was destroyed"
      redirect_to questions_path
    else
      flash[:error] = "Error deleting question"
      render :show
    end
  end
end
