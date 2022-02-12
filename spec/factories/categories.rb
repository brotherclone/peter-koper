FactoryBot.define do
  factory :category do
    name {Faker:: Lorem.word }
    factory :category_with_memories do
      after(:create) do |category|
        create(:memory, category: category)
      end
    end
  end
end
