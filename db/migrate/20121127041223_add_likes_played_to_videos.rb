class AddLikesPlayedToVideos < ActiveRecord::Migration
  def change
    add_column :videos,:played,:string
    add_column :videos,:likes, :string
  end
end
