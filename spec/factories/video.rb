FactoryBot.define do
  factory :video do
    is_live {true}
    file {Faker::Internet.url}
    memory
  end
end
