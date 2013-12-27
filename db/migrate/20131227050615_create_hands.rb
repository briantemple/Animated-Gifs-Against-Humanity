class CreateHands < ActiveRecord::Migration
  def change
    create_table :hands do |t|
      t.references :user
      t.references :game
      t.timestamps
    end
  end
end
