FactoryBot.define do
  factory :operation do
    amount { rand(-100..100) }
    account
    operation_name
  end
end
