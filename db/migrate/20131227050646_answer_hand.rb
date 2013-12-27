class AnswerHand < ActiveRecord::Migration
  def change
    create_table :answers_hands do |t|
      t.references :answer
      t.references :hand
    end

    add_index :answers_hands, [:answer_id, :hand_id]
    add_index :answers_hands, :hand_id
  end
end
