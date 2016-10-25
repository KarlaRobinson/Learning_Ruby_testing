class VotesController < ApplicationController
  def new
    @vote = Vote.new
    current_user.votes << @vote
    Question.find(params[:question_id]).votes << @vote
    p @vote
    p @vote.save
  end

  def create
  end
end
