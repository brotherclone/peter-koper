FactoryBot.define do
  factory :video do
    is_live {true}
    title { Faker::Lorem.word }
    url {Faker::Internet.url}
    video_service {1}
    video_id { Faker::Internet.uuid }
    memory
  end
end
