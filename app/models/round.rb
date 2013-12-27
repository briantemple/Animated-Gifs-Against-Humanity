class Round < ActiveRecord::Base
  belongs_to :game
  belongs_to :question

  before_create :build_dependencies

  private
  def build_dependencies
    # TODO : determine why "can't write unknown attribute `round_id'" error occurs
    # when setting self.question instead of self.question_id
    self.question_id = Question.limit(1).offset(rand(Question.count)).first.id
  end
end
