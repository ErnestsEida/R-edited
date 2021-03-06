require 'faker'

# Default awards
apple = Award.find_or_initialize_by(title: "Applesauce", value: 10)
apple.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'apple.png')), filename: 'apple.png', content_type: 'image/png') if apple.image.blank?
apple.save
garlic = Award.find_or_initialize_by(title: "Spicy", value: 20)
garlic.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'garlic.png')), filename: 'garlic.png', content_type: 'image/png') if garlic.image.blank?
garlic.save
broc = Award.find_or_initialize_by(title: "Fresh", value: 30)
broc.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'broccoli.png')), filename: 'broccoli.png', content_type: 'image/png') if broc.image.blank?
broc.save
potato = Award.find_or_initialize_by(title: "Breezy", value: 40)
potato.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'potato.png')), filename: 'potato.png', content_type: 'image/png') if potato.image.blank?
potato.save

# Admin user
if User.find_by(email: "admin@admin.com", admin: true).blank?
  User.create(email: "admin@admin.com", username: "admin", password: "123456", password_confirmation: "123456", confirmed_at: Time.now, admin: true)
end

# Default homepage object
if !Homepage.exists?
  Homepage.create()
end

# Generated Users
fake_users = (1..5).map do |index|
  if foundUser = User.find_by(email: "example#{ index }@example.com")
    foundUser
  else
    User.create!(email: "example#{ index }@example.com", username: Faker::Name.name, password: "123456", password_confirmation: "123456", confirmed_at: Time.now)
  end
end

# Generated Communities
  comm1 = Community.find_or_create_by(title: "Funny", user: fake_users.first)
  comm2 = Community.find_or_create_by(title: "Programming", user: fake_users[-1])

# Generated Posts
(1..2).each do
  Community.all.each do |community|
    fake_users.each do |user|
      post = community.posts.new(title: Faker::IndustrySegments.industry, user: user)
      post.content = Faker::Lorem.paragraph(sentence_count: 10, supplemental: true, random_sentences_to_add: 50)
      post.save
    end
  end
end

# Recent Events
(1..4).each do
  event = RecentEvent.find_or_initialize_by(title: Faker::IndustrySegments.industry, description: Faker::Lorem.paragraph(sentence_count: 10, supplemental: true, random_sentences_to_add: 50))
  event.thumbnail.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'apple.png')), filename: 'apple.png', content_type: 'image/png') if event.thumbnail.blank?
  event.save
end
