class OperationName < ApplicationRecord
  has_many :operations

  validates_presence_of :name
  validates :name, uniqueness: true
end
