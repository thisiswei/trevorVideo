class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :youtube_username
      t.string :vimeo_username
      t.string :name

      t.timestamps
    end
  end
end
