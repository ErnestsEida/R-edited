class TokenPack < ApplicationRecord
  validates :title, length: { minimum: 3, maximum: 16 }
  validates :title, :description, :price, :token_amount, presence: true
end
