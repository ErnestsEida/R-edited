class Comment < ApplicationRecord
  validates :content, presence: true, length: { minimum: 2, maximum: 512 }
  belongs_to :post
  belongs_to :user
end
