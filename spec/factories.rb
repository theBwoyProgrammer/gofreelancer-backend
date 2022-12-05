FactoryBot.define do
  factory :freelancer do
    name { Faker::Name.name }
    details { Faker::Lorem.paragraph }
    photo { Faker::Internet.url }
    fee { Faker::Number.between(from: 5, to: 100) }
    location { Faker::Address.full_address_as_hash(:full_address) }
  end
end
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
  end
end
FactoryBot.define do
  factory :reservation do
    appointment_date { Faker::Date.forward(days: 23) }
    association :user
    association :freelancer
  end
  # trait :with_details do
  #   after(:create) do |user|
  #     create(:reservation, user_id: user.id, freelancer_id: freelancer.id)
  #   end
  # end
end