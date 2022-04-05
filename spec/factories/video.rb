FactoryBot.define do
  factory :video do
    is_live {true}
    link { Faker::Internet.url(host: 'domain.com', path: '/file.mp4') }
    video_service {'vimeo'}
    memory
  end
end
