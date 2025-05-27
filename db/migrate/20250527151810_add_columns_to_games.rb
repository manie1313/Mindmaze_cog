class AddColumnsToGames < ActiveRecord::Migration[7.2]
  def change
    add_column :games, :name, :string
    add_column :games, :category, :string
    add_column :games, :description, :text
    add_column :games, :embed_link, :string
  end
end
