class GamesController < ApplicationController
  before_filter :ensure_authenticated

  def index
    @games = current_user.games
    @friends = current_user.friends
  end

  def create
    users = [current_user]
    friends = current_user.friends

    JSON.parse(params[:users]).each do |user|
      users << User.from_uid(user, friends)
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
