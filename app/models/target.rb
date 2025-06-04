class Target < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  has_many :performances
  has_many :games, through: :performances

  validates :sleep, presence: true
  validates :sleep, numericality: { only_integer: true }
  validates :sleep, inclusion: { in: (0..24) }
end
