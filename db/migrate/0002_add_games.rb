class AddGames < ActiveRecord::Migration
  def up
    create_table :games do |t|
      t.boolean :finished
      t.string  :answer
      t.integer :turn_count
      t.integer :player_id
    end
  end

  def down
    drop_table :games
  end
end
