class Game < ApplicationRecord
  has_many :performances, dependent: :destroy
  has_many :users, through: :performances

  validates :mode, presence: true
  validates :name, presence: true
  validates :category, presence: true
  validates :url, presence: true
  validates :description, presence: true
end
