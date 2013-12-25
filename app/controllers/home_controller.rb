class HomeController < ApplicationController
  def index
    @question = Question.limit(1).offset(rand(Question.count)).first
    # @answers = Answer.order("RAND(id)").limit(10)
    @answers = Answer.all().sample(10)
  end
end
