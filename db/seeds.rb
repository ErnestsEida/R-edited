require 'faker'

# Default awards
apple = Award.find_or_create_by(title: "Applesauce", value: 10)
apple.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'apple.png')), filename: 'apple.png', content_type: 'image/png')
garlic = Award.find_or_create_by(title: "Spicy", value: 20)
garlic.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'garlic.png')), filename: 'garlic.png', content_type: 'image/png')
broc = Award.find_or_create_by(title: "Fresh", value: 30)
broc.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'broccoli.png')), filename: 'broccoli.png', content_type: 'image/png')
potato = Award.find_or_create_by(title: "Breezy", value: 40)
potato.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'potato.png')), filename: 'potato.png', content_type: 'image/png')

# Generated Users
(1..5).each do |index|
  User.create(email: "example#{ index }@example.com", username: Faker::Name.name, password: "123456", password_confirmation: "123456", confirmed_at: Time.now)
end

# Generated Communities
comm1 = Community.create(title: "Funny", user: User.first)
comm2 = Community.create(title: "Programming", user: User.last)

# Generated Posts
(1..2).each do
  Community.all.each do |community|
    (1..5).each do |x|
      post = community.posts.new(title: Faker::IndustrySegments.industry, user_id: x)
      post.content = Faker::Lorem.sentence(word_count: 100 * x)
      post.save
    end
  end
end
