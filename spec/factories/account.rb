FactoryBot.define do
  factory :account do
    code { "#{Faker::Code.imei}_#{rand(100)}" }
  end
end
