class Game < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :hands
  has_many :rounds

  before_create :build_dependencies

  private
  def build_dependencies
    self.users.each do |user|
      puts "Creating hand for #{user.name} in game #{self.id}"
      self.hands.build(attributes: {user_id: user.id})
    end

    self.rounds.build

    true
  end
end
