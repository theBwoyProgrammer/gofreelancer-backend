FactoryBot.define do
  factory :freelancer do
    name { Faker::Name.name }
    details { Faker::Lorem.paragraph }
    photo { Faker::Internet.url }
    fee { Faker::Number.between(from: 5, to: 100) }
    location { Faker::Address.full_address_as_hash(:full_address) }
  end
end