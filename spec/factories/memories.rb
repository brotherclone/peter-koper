FactoryBot.define do
  factory :memory do
    is_live {true}
    body { Faker::Lorem.paragraph }
    title { Faker::Lorem.word }
    image { Faker::Internet.url}
    occurrence { Faker::Date }
    factory :memory_with_categories do
      after(:create) do |memory|
        create(:category, memory: memory)
      end
    end
    factory :memory_with_tags do
      after(:create) do |memory|
        create(:tag, memory: memory)
      end
    end
  end
end
