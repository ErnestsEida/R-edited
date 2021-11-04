# Post model factory
FactoryBot.define do
  factory :post do
    title {"Title"}
    description {"Description"}
    user
  end

  factory :user do
    email {"example@example.com"}
  end
end
