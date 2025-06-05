class ChangeTimeToIntegerInPerformances < ActiveRecord::Migration[7.2]
  def change
    remove_column :performances, :time
    add_column :performances, :time, :float
  end
end
