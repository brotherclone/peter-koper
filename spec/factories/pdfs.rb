FactoryBot.define do
  factory :pdf do
    page_count { 3 }
    file { Faker::Internet.url(host: 'domain.com', path: '/file.pdf') }
    memory
  end
end