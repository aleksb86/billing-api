FactoryBot.define do
  factory :account do
    code { Faker::Code.unique.imei }
  end
end
