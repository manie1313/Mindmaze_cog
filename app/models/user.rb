class User < ApplicationRecord
  has_one_attached :avatar

  has_many :performances
  has_many :targets
  has_many :games, through: :performances

  validates :username, length: { in: 2..10 }
  validates :username, uniqueness: true
  validates :username, presence: true
  validates :age, presence: true
  validates :age, numericality: { only_integer: true }
  validates :email, presence: true
  validates :email, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
