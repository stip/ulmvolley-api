class Training < ApplicationRecord

  validates :at, presence: true

  has_many :attendances
  has_many :players, through: :attendances
end