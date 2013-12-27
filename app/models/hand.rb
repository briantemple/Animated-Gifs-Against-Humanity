class Hand < ActiveRecord::Base
  has_one :user
  belongs_to :game
  has_and_belongs_to_many :answers

  before_create :build_dependencies

  private
  def build_dependencies

    used_answers = []
    self.game.hands.each do |hand|
      hand.answers.each do |answer|
        used_answers << answer.id
      end
    end

    # Start with just 10 random
    # self.answers = Answer.where.not(id: used_answers).order("RAND(id)").limit(10)
    self.answers = Answer.where.not(id: used_answers).sample(10)
  end
end
