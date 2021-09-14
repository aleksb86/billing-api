# frozen_string_literal: true

Account.delete_all
OperationName.delete_all
Operation.delete_all

5.times { Account.create(code: Faker::Code.imei) }

10.times { OperationName.create(name: Faker::Bank.name) }

100.times do
  Operation.create(
    account: Account.order(Arel.sql('RANDOM()')).first,
    operation_name: OperationName.order(Arel.sql('RANDOM()')).first,
    amount: rand(-100..100)
  )
end
