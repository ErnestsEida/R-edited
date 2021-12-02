class Community < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 , maximum: 16 }
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :tags, as: :tagable, dependent: :destroy
end
