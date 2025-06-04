class Goal < ApplicationRecord
  has_many :targets, dependent: :destroy
  has_many :games
  # has_many :performances, through: :games

  validates :name, presence: true
end
