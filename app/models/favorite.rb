class Favorite < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  validates :movie_id, uniqueness: { scope: :user_id }, presence: true
  validates :user_id, presence: true
end
