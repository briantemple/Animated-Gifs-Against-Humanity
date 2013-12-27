class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :game
      t.references :question

      t.timestamps
    end
  end
end
