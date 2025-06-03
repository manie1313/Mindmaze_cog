class Goal < ApplicationRecord
  has_many :targets
  has_many :games
  # has_many :performances, through: :games

  validates :name, presence: true
end
