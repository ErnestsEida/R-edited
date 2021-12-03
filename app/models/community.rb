class Community < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 , maximum: 16 }
  belongs_to :user
  has_many :posts, dependent: :destroy
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
