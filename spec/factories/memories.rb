FactoryBot.define do
  factory :memory do
    is_live {true}
    body { Faker::Lorem.paragraph }
    title { Faker::Lorem.word }
    show_title { true }
    image { Faker::Internet.url}
    occurrence { Faker::Date.backward(days: 1000) }
    fuzzy_date { 'regular' }
    factory :memory_with_tags do
      after(:create) do |memory|
        create(:tag, memory: memory)
      end
    end
    factory :memory_with_categories do
      after(:create) do |memory|
        create(:category, memory: memory)
      end
    end
    factory :memory_with_sub_categories do
      after(:create) do |memory|
        create(:sub_category, memory: memory)
      end
    end
    factory :memory_with_video do
      after(:create) do |memory|
        create(:video, memory: memory)
      end
    end
    factory :memory_with_pdf do
      after(:create) do |memory|
        create(:pdf, memory: memory)
      end
    end
  end
end
