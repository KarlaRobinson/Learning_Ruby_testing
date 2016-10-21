class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def index
    @answers = Answer.all
    redirect_to questions_all_path
  end

  def create
    @answer = Answer.new(text: params[:answer][:text])
    current_user.answers << @answer

    if Question.find(params[:question_id]).answers << @answer
      flash[:notice] = 'Your answer was created successfully'
      redirect_to user_question_answers_path
    else
      flash[:error] = "Your answer could not be saved (answer #{@answer.errors.messages[:text].join})"
      redirect_back fallback_location: new_user_question_answer_path(current_user)
    end
  end

end
