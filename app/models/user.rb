class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validates :email , email: {mode: :strict}
  validates :username , length: { minimum: 4 , maximum: 16 }
  validates :username , presence: true

  has_many :posts
end
