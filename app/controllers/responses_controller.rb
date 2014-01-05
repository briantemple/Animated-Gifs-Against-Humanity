class ResponsesController < ApplicationController
  before_filter :ensure_authenticated

  def create
     round = Round.find(params[:round_id])
     answer = Answer.find(params[:answer_id])
     hand = Hand.where(user_id: current_user.id, game_id: params[:game_id]).first

     puts "round:#{round.inspect}"
     puts "game:#{round.game.inspect}"

     # todo : ensure answer was in the hand
     Response.create(round: round, user: current_user, answer: answer)

     # Pick new hand and create new round if needed
     hand.remove_and_pick_new(answer)

     # Create a new round if needed
     round.game.rounds << Round.create if round.responses.length == round.game.users.length

     redirect_to round.game
  end
end
