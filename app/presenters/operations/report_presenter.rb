# frozen_string_literal: true

module Operations
  class ReportPresenter
    def initialize(args)
      @start_time = args[:start_time]
      @start_remainder = args[:start_remainder]
      @end_time = args[:end_time]
      @end_remainder = args[:end_remainder]
      @operations = args[:operations]
    end

    def as_json
      {
        start_remainder: { amount: @start_remainder, on_beginning_period: @start_time },
        end_remainder: { amount: @end_remainder, on_end_of_period: @end_time },
        operations: @operations.map do |operation|
          {
            id: operation.id,
            amount: operation.amount,
            account: operation.account.code,
            operation_name: operation.operation_name.name,
            time: operation.created_at
          }
        end
      }
    end
  end
end
