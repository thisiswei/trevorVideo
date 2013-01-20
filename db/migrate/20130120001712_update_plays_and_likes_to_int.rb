class UpdatePlaysAndLikesToInt < ActiveRecord::Migration
  def up
    remove_column :videos, :played
    remove_column :videos, :likes
  end

  def down
    add_column :videos, :played, :string
    add_column :videos, :likes, :string 
  end
end
