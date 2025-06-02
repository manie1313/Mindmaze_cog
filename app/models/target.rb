class Target < ApplicationRecord
  belongs_to :user
  has_many :performances, through: :user

  validates :sleep, presence: true
  validates :sleep, numericality: { only_integer: true }
  validates :sleep, inclusion: { in: (0..24) }
end
