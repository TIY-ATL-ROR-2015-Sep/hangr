class AddPlayer < ActiveRecord::Migration
  def up
    create_table :players do |t|
      t.string :name
      t.integer :age
      t.integer :total_wins
      t.string :email
    end
  end

  def down
    drop_table :players
  end
end
