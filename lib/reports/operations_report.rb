# frozen_string_literal: true

module Reports
  module OperationsReport
    def self.call(*args)
      ActiveRecord::Base.transaction(isolation: :read_committed) do
        operations_by_period(*args)
      end
    end

    def self.operations_by_period(account, start_time, end_time)
      return {} if start_time > end_time

      range = start_time..end_time
      account_id = account.id
      condition = Operation.where(account_id: account_id, created_at: range)
      operations = condition.includes(:account, :operation_name)
                            .order(created_at: :asc)
      start_remainder = operations.first&.amount
      end_remainder = condition.sum(:amount)
      {
        operations: operations || [],
        start_time: start_time,
        start_remainder: start_remainder || 0,
        end_remainder: end_remainder,
        end_time: end_time
      }
    rescue StandardError => e
      Rails.logger.error e.message
      Rails.logger.error e.backtrace.join("\n")
      {}
    end
  end
end
