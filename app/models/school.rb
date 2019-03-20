class School < ApplicationRecord
  # Validations
  validates :address, :principal, presence: true
  validates :name, uniqueness: true, presence: true
  validates :capacity, presence: true, numericality: {
    only_integer: true, less_than_or_equal_to: 52000,
    greater_than_or_equal_to: 0 }
  validates :private_school, inclusion: { in: [ true, false ] }

  # Associations
  has_many :students, dependent: :destroy
end
