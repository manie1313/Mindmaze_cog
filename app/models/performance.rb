class Performance < ApplicationRecord
  belongs_to :target
  belongs_to :game

  validates :description, length: { in: 10..40 }
  validates :description, presence: true
  validates :accuracy,  numericality: { only_integer: true }
  validates :completed, inclusion: [true, false]
end
