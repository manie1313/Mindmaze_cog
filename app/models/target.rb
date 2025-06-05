class Target < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  # added
  has_many :performances, dependent: :destroy
  has_many :games, through: :performances

  validates :sleep, presence: true
  validates :sleep, numericality: { only_integer: true }
  validates :sleep, inclusion: { in: (0..24) }
end
