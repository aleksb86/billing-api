# frozen_string_literal: true

module Operations
  class ListPresenter
    def initialize(operations)
      @operations = operations
    end

    def as_json
      @operations.map do |operation|
        {
          id: operation.id,
          amount: operation.amount,
          reminder: operation.reminder,
          account: operation.account.code,
          operation_name: operation.operation_name.name,
          time: operation.created_at
        }
      end
    end
  end
end
