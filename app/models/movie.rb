class Movie < ActiveRecord::Base
  belongs_to :user
  has_many :favorites

  validates :title, presence: true
  validates :imdbID, presence: true
end
