class AddContentToGames < ActiveRecord::Migration[7.2]
  def change
    add_column :games, :content, :text
  end
end
