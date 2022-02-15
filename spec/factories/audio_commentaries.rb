FactoryBot.define do
  factory :audio_commentaries do
    is_live {true}
    title { Faker::Lorem.word }
    file {Faker::Internet.url}
    memory
  end
end
