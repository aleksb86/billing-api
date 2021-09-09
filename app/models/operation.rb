class Operation < ApplicationRecord
  belongs_to :account, class_name: 'Account'
  belongs_to :operation_name, class_name: 'OperationName'

  validates_presence_of :amount, :account, :operation_name

  scope :by_account, ->(account_id) { where(account_id: account_id) }

  before_create do
    last_reminder = Operation.by_account(account_id).order(created_at: :asc).last&.reminder || 0
    self.reminder = last_reminder + amount
  end
end
