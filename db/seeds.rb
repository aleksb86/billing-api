# frozen_string_literal: true

%w[
  00000000000000042
  00000000000000043
  00000000000000044
  00000000000000045
  00000000000000046
].each { |code| Account.create(code: code) }

[
  'Операции между счетами',
  'Операции с валютой',
  'Лизинговые операции',
  'Перевод денежных средств',
  'Оказание услуг',
  'Выдача банковских гарантий'
].each { |name| OperationName.create(name: name) }

100.times do
  Operation.create(
    account: Account.order(Arel.sql('RANDOM()')).first,
    operation_name: OperationName.order(Arel.sql('RANDOM()')).first,
    amount: rand(-100..100)
  )
end
