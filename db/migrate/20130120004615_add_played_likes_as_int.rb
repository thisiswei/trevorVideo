class AddPlayedLikesAsInt < ActiveRecord::Migration
  def up
    add_column :videos, :played, :integer
    add_column :videos, :likes, :integer 
  end

  def down
    remove_column :videos, :played
    remove_column :videos, :likes
  end
end
