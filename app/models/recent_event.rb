class RecentEvent < ApplicationRecord
  has_one_attached :thumbnail
  validates :title, length: { minimum: 4, maximum: 28 }, presence: true
  validates :description, :thumbnail, presence: true
end
