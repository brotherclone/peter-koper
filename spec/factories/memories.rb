FactoryBot.define do
  factory :memory do
    is_live {true}
    body { Faker::Lorem.paragraph }
    title { Faker::Lorem.word }
    category
    image { Faker::Internet.url}
  end
end
