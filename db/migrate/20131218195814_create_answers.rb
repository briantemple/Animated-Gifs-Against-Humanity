class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :text
      t.string :url
      t.string :pictureId

      t.timestamps
    end
  end
end
