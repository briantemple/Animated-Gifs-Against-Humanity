class CreateGamesUsers < ActiveRecord::Migration
  def change
    create_table :games_users do |t|
      t.references :game
      t.references :user
    end

    add_index :games_users, [:game_id, :user_id]
    add_index :games_users, :user_id
  end
end
