class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def index
    @questions = Question.all
  end

  def show
  end

  def create
    p "*"* 50
    p params
    @question = Question.new(text: params[:question][:text])
    p @question

    if @question.save
      current_user.questions << @question
      flash[:notice] = 'Your question was created successfully'
    else
    p @question.errors
      flash[:error] = 'Your question could not be saved'
    end
    render 'show'
  end
end
