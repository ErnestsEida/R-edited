class PostAward < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :award
end
