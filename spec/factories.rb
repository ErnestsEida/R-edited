# Post model factory
FactoryBot.define do
  factory :post do
    title { "Title" }
    content { "Description" }
    user
    community
  end

  factory :user do
    email { "example@example.com" }
  end

  factory :community do
    title { Faker::Game.title }
    user
  end
end
