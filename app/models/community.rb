class Community < ApplicationRecord
  include Tagable
  validates :title, presence: true, length: { minimum: 3 , maximum: 16 }
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :tag_references, as: :tagable, dependent: :destroy
end
