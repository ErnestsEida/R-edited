class Award < ApplicationRecord
  has_one_attached :image
  has_many :post_awards
  validates :title, :value, :image, presence: true
  validates :title, length: { minimum: 3, maximum: 24 }
  validates :value, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
