class Post < ApplicationRecord
  has_rich_text :content
  validates :title , presence: true , length: { minimum: 3 , maximum: 70 }
  validates :content , presence: true
  belongs_to :user
  belongs_to :community
  has_many :bookmarked_posts, dependent: :destroy
  has_many :users, through: :bookmarked_posts
  has_many :comments, dependent: :destroy
  has_many :post_awards, dependent: :destroy
  has_many :awards, -> { order 'post_awards.created_at' }, through: :post_awards
  has_many :tag_references, as: :tagable, dependent: :destroy

  def tags_as_json
    tag_references.map do |reference|
      { value: reference.tag.title }
    end.to_json
  end

  def tags=(json)
    tags_params = JSON.parse(json)
    tags_params.each do |tag_param|
      tag = Tag.find_or_create_by(title: tag_param['value'])
      self.tag_references.find_or_initialize_by(tag: tag)
    end
  end
end
