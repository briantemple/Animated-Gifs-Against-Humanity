class GamesController < ApplicationController
  before_filter :ensure_authenticated

  def index
    @games = current_user.games
    @friends = current_user.friends
  end

  def new
    users = [current_user]
    params[:users].each do |user|
      users << User.from_stub(user)
    end

    redirect_to Game.create(users: users)
  end

  def show
    @game = Game.find(params[:id])
  end

  def update
    respond_with Game.update(params[:id], params[:game])
  end
end
