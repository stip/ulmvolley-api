# the central entity in this app. A Volleyball player with all his facilities :)
class Player < ApplicationRecord

  validates_presence_of :name

  has_many :attendances
  has_many :trainings, through: :attendances
end
