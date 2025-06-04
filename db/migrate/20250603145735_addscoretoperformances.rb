class Addscoretoperformances < ActiveRecord::Migration[7.2]
  def change
    add_column :performances, :score, :integer
  end
end
