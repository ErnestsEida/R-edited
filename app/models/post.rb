class Post < ApplicationRecord
  validates :title , presence: true , length: { minimum: 3 , maximum: 70 }
  validates :content , presence: true
  belongs_to :user
  belongs_to :community
  has_many :bookmarked_posts, dependent: :destroy
  has_many :users, through: :bookmarked_posts
  has_many :comments, dependent: :destroy
  has_many :post_awards, dependent: :destroy
  has_many :awards, -> { order 'post_awards.created_at' }, through: :post_awards
  has_one_attached :banner
end
