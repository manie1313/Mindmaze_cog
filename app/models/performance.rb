class Performance < ApplicationRecord
  belongs_to :target
  belongs_to :game

  # validates :description, length: { in: 10..100 }
  validates :description, presence: true
  validates :accuracy,  numericality: { only_integer: true }
  validates :completed, inclusion: [true, false]
  validates :score, presence: true
end
