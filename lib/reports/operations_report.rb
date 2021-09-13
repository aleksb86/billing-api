# frozen_string_literal: true

module Reports
  module OperationsReport
    def self.operations_by_period(account, start_date, end_date)
      return [] if start_date > end_date

      range = start_date..end_date
      Operation.includes(:account, :operation_name)
               .where(account_id: account.id, created_at: range)
               .order(created_at: :asc)
    rescue StandardError => e
      Rails.logger.error e.message
      Rails.logger.error e.backtrace.join("\n")
      []
    end
  end
end
