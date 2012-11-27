class AddUserNameToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :user_name, :string
  end
end
