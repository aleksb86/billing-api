class Operation < ApplicationRecord
  belongs_to :account
  belongs_to :operation_name

  validates :amount, :account, :operation_name, presence: true

  scope :by_account, ->(account_id) { where(account_id: account_id) }

  paginates_per 50
end
