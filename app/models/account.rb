class Account < ApplicationRecord
  has_many :operations, dependent: :destroy

  validates :code, presence: true
  validates :code, uniqueness: true

  paginates_per 50
end
