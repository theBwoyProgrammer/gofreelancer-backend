FactoryBot.define do
  factory :freelancer do
    name { Faker::Name.name }
    details { Faker::Lorem.paragraph }
    photo { Faker::Internet.url }
    fee { Faker::Number.between(from: 5, to: 100) }
    location { Faker::Address.street_address }
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
end

FactoryBot.define do
  factory :specialization do
    name { Faker::ProgrammingLanguage.name }
  end
end
