FactoryBot.define do
  factory :account do
    code { Faker::Code.imei }
  end
end
