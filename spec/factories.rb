# Post model factory
FactoryBot.define do
  factory :post do
    title {"Title"}
    description {"Description"}
    user
  end

  factory :user do
    email {"tester@tester.com"}
  end
end
