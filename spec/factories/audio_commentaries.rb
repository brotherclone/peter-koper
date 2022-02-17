FactoryBot.define do

  factory :audio_commentary do
    is_live { true }
    title { Faker::Lorem.word }
    file { true }
    memory
  end
end
