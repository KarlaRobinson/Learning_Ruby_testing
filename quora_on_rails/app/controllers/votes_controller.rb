class VotesController < ApplicationController
  def new
    @vote = Vote.new
    question = Question.find(params[:question_id])
    current_user.votes << @vote
    question.votes << @vote
    @vote.save
    @id = question.id
    @v_num = question.votes.length
  end
end
