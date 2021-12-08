class Tag < ApplicationRecord
  has_many :tag_references, dependent: :destroy
  has_many :posts, through: :tag_references, source: :tagable, source_type: 'Post'
  has_many :communities, through: :tag_references, source: :tagable, source_type: 'Community'
end
