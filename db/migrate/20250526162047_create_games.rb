class CreateGames < ActiveRecord::Migration[7.2]
  def change
    create_table :games do |t|
      t.string :mode
      t.references :goal, null: false, foreign_key: true
      t.timestamps
    end
  end
end
