class Feedback < ApplicationRecord
  has_one_attached :image
  validates :header, presence: true, length: { minimum: 1, maximum: 36 }
  validates :description, presence: true, length: { minimum: 4, maximum: 70 }
  validates :image, presence: true
end
