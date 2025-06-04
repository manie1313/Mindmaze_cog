class CreateTargets < ActiveRecord::Migration[7.2]
  def change
    create_table :targets do |t|
      t.integer :sleep
      t.string :goal
      t.references :user, null: false, foreign_key: true
      t.references :goal, null: false, foreign_key: true
      t.timestamps
    end
  end
end
