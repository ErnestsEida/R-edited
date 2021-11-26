class Post < ApplicationRecord
  validates :title , presence: true , length: { minimum: 3 , maximum: 70 }
  validates :content , presence: true
  belongs_to :user
  belongs_to :community
  has_many :bookmarked_posts
  has_many :users, through: :bookmarked_posts
end
