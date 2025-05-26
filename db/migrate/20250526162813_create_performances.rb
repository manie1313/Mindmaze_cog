class CreatePerformances < ActiveRecord::Migration[7.2]
  def change
    create_table :performances do |t|
      t.text :description
      t.decimal :accuracy
      t.time :time
      t.boolean :completed
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
