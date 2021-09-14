class OperationName < ApplicationRecord
  has_many :operations, dependent: :restrict_with_exception

  validates :name, presence: true
  validates :name, uniqueness: true

  paginates_per 50
end
