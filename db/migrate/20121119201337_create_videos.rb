class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :key
      t.string :title
      t.string :source
      t.string :thumnail_url
      t.integer:first_person_id
      t.timestamps
    end
  end
end
