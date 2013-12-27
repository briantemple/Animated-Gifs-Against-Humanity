class RoundsController < ApplicationController
  def show
    @round = Round.find(params[:id])
    @hand = Hand.where(user_id: current_user.id, game_id: params[:game_id]).first
  end
end
