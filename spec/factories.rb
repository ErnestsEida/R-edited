# Post model factory
FactoryBot.define do
  factory :post do
    title {"Title"}
    description {"Description"}
    user_id {1}
  end
end
