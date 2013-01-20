class UpdatePlaysAndLikesToInt < ActiveRecord::Migration
  def up
    change_column :videos, :played, :integer
    change_column :videos, :likes, :integer
  end

  def down
    change_column :videos, :played, :string
    change_column :videos, :likes, :string 
  end
end
