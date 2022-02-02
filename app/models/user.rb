class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validates :email, email: { mode: :strict }
  validates :username, uniqueness: true, presence: true, length: { minimum: 4 , maximum: 100 }
  validates :tokens, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts, dependent: :destroy
  has_many :communities, dependent: :destroy
  has_many :bookmarked_posts, dependent: :delete_all
  has_many :posts, through: :bookmarked_posts
  has_many :comments, dependent: :destroy
  has_many :moderators, dependent: :destroy
  has_many :communities, through: :moderators
  has_many :post_awards, dependent: :destroy
  has_many :subscribers, dependent: :destroy

  attr_writer :login

  def purchase(award_id)
    award = Award.find(award_id)
    update(tokens: self.tokens - award.value)
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
