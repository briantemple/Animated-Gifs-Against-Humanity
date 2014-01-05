class Hand < ActiveRecord::Base
  has_one :user
  belongs_to :game
  has_and_belongs_to_many :answers

  before_create :build_dependencies

  def remove_and_pick_new(answer)
    self.answers.delete(answer)
    self.answers << draw_answers(1)
  end

  private
  def build_dependencies
    self.answers = draw_answers(10)
  end

  def draw_answers(num_answers)

    used_answers = []
    self.game.hands.each do |hand|
      hand.answers.each do |answer|
        used_answers << answer.id
      end
    end

    # Answer.where.not(id: used_answers).order("RAND(id)").limit(num_answers)
    Answer.where.not(id: used_answers).sample(num_answers)
  end

end
