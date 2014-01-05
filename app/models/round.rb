class Round < ActiveRecord::Base
  belongs_to :game
  belongs_to :question
  has_many :responses

  before_create :build_dependencies

  def played_by? (user)
   self.responses.any? {|response| response.user == user}
  end

  private
  def build_dependencies
    # TODO : determine why "can't write unknown attribute `round_id'" error occurs
    # when setting self.question instead of self.question_id
    self.question_id = Question.limit(1).offset(rand(Question.count)).first.id
  end
end
