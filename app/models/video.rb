class Video < ActiveRecord::Base
  PER_PAGE = 20
  SOURCES  = ["youtube","vimeo"]
  
  attr_accessible :source, :key, :title, :thumnail_url
  has_many :favorites
  has_many :people, through: :favorites
  belongs_to :first_person, class_name: 'Person'

  validates :key, presence: true, uniqueness: true
  validates :title, presence: true
  validates :source, presence: true
  validates_inclusion_of :source, :in => SOURCES

end
