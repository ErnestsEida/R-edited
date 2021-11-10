class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validates :email, email: { mode: :strict }
  validates :username, presence: true, length: { minimum: 4 , maximum: 16 }

  has_many :posts
end
