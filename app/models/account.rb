class Account < ApplicationRecord
  has_many :operations, dependent: :destroy

  validates_presence_of :code
  validates :code, uniqueness: true
end
