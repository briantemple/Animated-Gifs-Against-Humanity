class RoundsController < ApplicationController
  before_filter :ensure_authenticated

  def show
    @round = Round.find(params[:id])
    redirect_to @round.game if @round.played_by? current_user

    @hand = Hand.where(user_id: current_user.id, game_id: params[:game_id]).first
    redirect_to :games if @hand.nil?
  end
end
