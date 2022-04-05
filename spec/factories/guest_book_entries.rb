FactoryBot.define do
  factory :guest_book_entry do
    title {Faker::Lorem.word}
    body {Faker::Lorem.paragraph}
    memory
    image_one_url {Faker::Internet.url}
    image_two_url {Faker::Internet.url}
    image_three_url {Faker::Internet.url}
    guest_name { Faker::Name.name}
    guest_email {Faker::Internet.email}
    admin_state { "submitted" }
  end
end
