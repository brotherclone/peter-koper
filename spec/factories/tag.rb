FactoryBot.define do
  factory :tag do
    name { Faker::Lorem.word }
    factory :tag_with_categories do
      after(:create) do |tag|
        create(:category, tag: tag)
      end
    end
    factory :tag_with_memories do
      after(:create) do |tag|
        create(:memory, tag: tag)
      end
    end
  end
end
