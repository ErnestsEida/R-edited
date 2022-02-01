class RecentNews < ApplicationRecord
  has_one_attached :thumbnail
  validates :title, length: { minimum: 4, maximum: 64 }, presence: true
  validates :description, :thumbnail, presence: true
end
