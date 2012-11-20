class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :person_id
      t.integer :video_id

      t.timestamps
    end
  end
end
