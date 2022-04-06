FactoryBot.define do
  factory :video do
    is_live {true}
    link { Faker::Internet.url(host: 'domain.com', path: '/file.mp4') }
    video_service {'vimeo'}
    aspect_ratio {'sixteen_by_nine'}
    memory
  end
end
