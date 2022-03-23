class CreatePlaythroughs < ActiveRecord::Migration[7.0]
  def change
    create_table :playthroughs do |t|
      t.integer :score, null: false
      t.timestamp :started_playing, null: false
      t.time :time_spent, null: false
      t.belongs_to :players, null: false

      t.timestamps
    end
  end
end
