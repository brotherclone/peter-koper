FactoryBot.define do
  factory :memory do
    is_live {true}
    body { Faker::Lorem.paragraph }
    title { Faker::Lorem.word }
    image { Faker::Internet.url}
    occurrence { Faker::Date }
  end
end
