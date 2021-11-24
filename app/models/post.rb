class Post < ApplicationRecord
  validates :title , presence: true , length: { minimum: 3 , maximum: 70 }
  validates :content , presence: true
  belongs_to :user
  belongs_to :community
  has_many :comments, dependent: :destroy
end
