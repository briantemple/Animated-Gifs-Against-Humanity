class AnswersController < ApplicationController
    respond_to :json

  def index
    respond_with Answer.all
  end

  def show
    respond_with Answer.find(params[:id])
  end

  def create
    respond_with Answer.create(params[:entry])
  end

  def update
    respond_with Answer.update(params[:id], params[:entry])
  end

  def destroy
    respond_with Answer.destroy(params[:id])
  end
end
