class CreateGames < ActiveRecord::Migration[7.2]
  def change
    create_table :games do |t|
      t.string :mode

      t.timestamps
    end
  end
end
