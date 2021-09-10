# frozen_string_literal: true

5.times { Account.create(code: Faker::Code.imei) }

10.times { OperationName.create(name: Faker::Bank.name) }

100.times do
  Operation.create(
    account: Account.order(Arel.sql('RANDOM()')).first,
    operation_name: OperationName.order(Arel.sql('RANDOM()')).first,
    amount: rand(-100..100)
  )
end
