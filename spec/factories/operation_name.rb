FactoryBot.define do
  factory :operation_name do
    name { Faker::Bank.unique.name }
  end
end
