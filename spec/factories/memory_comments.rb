FactoryBot.define do
  factory :memory_comment do
    author_name {Faker::Name.name }
    author_email { Faker::Internet.email }
    is_live {true}
    body { Faker::Lorem.paragraph }
    memory
  end
end
