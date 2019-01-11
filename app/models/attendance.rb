# frozen-string-literal: true

# Attendances: trainings and match days.
class Attendance < ApplicationRecord
  attr_accessor :participant, :reason

  belongs_to :player
  belongs_to :training

  enum participation: { no: 0, maybe: 1, yes: 2 }
end