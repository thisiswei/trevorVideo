class AddDataToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :data, :text 
  end
end
