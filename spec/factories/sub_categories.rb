FactoryBot.define do
  factory :sub_category do
    category
    name { Faker::Lorem.word }
  end
end
