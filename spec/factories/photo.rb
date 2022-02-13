FactoryBot.define do
  factory :photo do
    image { Faker::Internet.url }
    caption { Faker::Lorem.paragraph }
    memory
  end
end
