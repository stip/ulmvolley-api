class Player < ApplicationRecord

	validates_presence_of :name

	has_many :attendances
	has_many :trainings, through: :attendances
end
