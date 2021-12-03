class Award < ApplicationRecord
  has_one_attached :image
  has_many :post_awards
end
