class AddEmailToPlayers < ActiveRecord::Migration
  def up
    add_column :players, :email, :string
  end

  def down
    remove_column :players, :email
  end
end
