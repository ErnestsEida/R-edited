class TokenPack < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 16 }
  validates :description, presence: true
  validates :price, presence: true
  validates :token_amount, presence: true
end
