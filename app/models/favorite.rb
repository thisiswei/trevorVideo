class Favorite < ActiveRecord::Base
  attr_accessible :video_id, :person_id
  belongs_to :person
  belongs_to :video
end
