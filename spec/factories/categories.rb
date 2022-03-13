FactoryBot.define do
  factory :category do
    name {Faker:: Lorem.word }
    factory :category_with_memories do
      after(:create) do |category|
        create(:memory, category: category)
      end
    end
    factory :category_with_tags do
      after(:create) do |category|
        create(:tag, category: category)
      end
    end
    factory :category_with_sub_categories do
      after(:create) do |category|
        create(:sub_category, category: category)
      end
    end
  end
end
