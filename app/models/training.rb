class Training < ApplicationRecord

  validates :at, presence:true

  has_many :attendences
  has_many :players, through: :attendances
end