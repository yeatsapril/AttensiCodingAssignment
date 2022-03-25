class AddTimeSpentColumnToPlaythroughs < ActiveRecord::Migration[7.0]
  def change
    add_column :playthroughs, :time_spent, :float
  end
end
