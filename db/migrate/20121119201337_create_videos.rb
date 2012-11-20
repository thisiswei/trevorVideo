class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :key
      t.string :title
      t.string :source
      t.integer:first_person_id
      t.string :thumbnail_url
      t.datetime :created_at
    end
  end
end
