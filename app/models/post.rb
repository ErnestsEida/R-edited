class Post < ApplicationRecord
  include Tagable

  belongs_to :user
  belongs_to :community
  has_many :bookmarked_posts, dependent: :destroy
  has_many :users, through: :bookmarked_posts
  has_many :comments, dependent: :destroy
  has_many :post_awards, dependent: :destroy
  has_many :awards, -> { order 'post_awards.created_at' }, through: :post_awards
  has_many :tag_references, as: :tagable, dependent: :destroy

  has_rich_text :content
  has_one_attached :banner

  validates :title , presence: true , length: { minimum: 3 , maximum: 70 }
  validates :content , presence: true

  paginates_per 5

  def reward(user, award_id)
    PostAward.create(user: user, post_id: self.id, award_id: award_id)
  end
end
