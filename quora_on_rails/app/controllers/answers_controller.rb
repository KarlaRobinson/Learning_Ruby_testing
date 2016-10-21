class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(text: params[:answer][:text])

    if current_user.answers << @answer
      flash[:notice] = 'Your answer was created successfully'
      redirect_to user_answers_path
    else
      flash[:error] = "Your answer could not be saved (answer #{@answer.errors.messages[:text].join})"
      redirect_back fallback_location: new_user_answer_path(current_user.id)
    end
  end
end
