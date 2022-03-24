FactoryBot.define do
  factory :video do
    is_live {true}
    file { Faker::Internet.url(host: 'domain.com', path: '/file.mp4') }
    memory
  end
end
