FactoryBot.define do
  factory :operation_name do
    name { "#{Faker::Bank.name}_#{SecureRandom.hex(10)}" }
  end
end
