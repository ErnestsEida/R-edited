class Community < ApplicationRecord
  include Tagable
  validates :title, presence: true, length: { minimum: 3 , maximum: 16 }
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :tag_references, as: :tagable, dependent: :destroy
  has_many :moderators
  has_many :users, through: :moderators

  def moderator_emails=(params)
    self.moderators.destroy_all
    params.each do |key, value|
      user = User.find_by(email: value["email"])
      next if user.blank?

      self.moderators.find_or_initialize_by(user: user)
    end
  end

  def moderator_emails
    (self.users.pluck(:email) + Array.new(5)).slice(0..4)
  end
end
