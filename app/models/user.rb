class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validates :email , email: {mode: :strict}

  has_many :posts, dependent: :destroy
end
