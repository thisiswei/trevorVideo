class Favorite < ActiveRecord::Base
  attr_accessor :key, :title, :source, :thumbnail_url, :played,:likes,:user_name,:data
  attr_accessible :key, :title, :created_at, :person_id, :source, :thumbnail_url,:played,:likes,:user_name,:data
  
  validates_presence_of :video_id, :person_id
  validates_uniqueness_of :video_id, scope: :person_id

  belongs_to :person
  belongs_to :video

  before_validation :find_or_create_video, on: :create
  after_create :update_video_first_person

  def find_or_create_video
    if video = Video.find_by_key_and_source(key,source)
      self.video = video
    else
      self.video = Video.create(key: key, title: title, created_at: created_at, source: source, thumbnail_url: thumbnail_url, played: played, likes: likes, user_name: user_name,data: data)
    end
  end

  def update_video_first_person
    video.first_person = video.favorites.order('created_at ASC').first.person
    video.save!
  end
end
