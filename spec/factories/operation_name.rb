FactoryBot.define do
  factory :operation_name do
    name { "#{Faker::Bank.name}_#{rand(100)}" }
  end
end
