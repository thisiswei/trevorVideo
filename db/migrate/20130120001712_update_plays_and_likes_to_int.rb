class UpdatePlaysAndLikesToInt < ActiveRecord::Migration
  def up
    remove_column :videos, :played
    remove_column :videos, :likes
  end

  def down
    add_column :videos, :played, :integer
    add_column :videos, :likes, :integer 
  end
end
