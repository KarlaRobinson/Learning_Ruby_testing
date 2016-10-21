class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def all
    @questions = Question.all
  end

  def index
  end

  def show
  end

  def create
    @question = Question.new(text: params[:question][:text])

    if current_user.questions << @question
      flash[:notice] = 'Your question was created successfully'
      redirect_to user_questions_path
    else
      flash[:error] = "Your question could not be saved (Question #{@question.errors.messages[:text].join})"
      redirect_back fallback_location: new_user_question_path(current_user.id)
    end
  end

  def destroy
    @question.destroy
    flash[:notice] = 'Your question was deleted'
    redirect_back fallback_location: user_questions_path
  end


  private

    def question_params
      params.require(:question).permit(:text)
    end
end
