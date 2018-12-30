# frozen-string-literal: true

require 'rack/reducer'

# Attendances: trainings and match days.
class Attendance < ApplicationRecord
  extend Rack::Reducer

  belongs_to :player
  belongs_to :training

  enum presence: %I[no maybe yes]

  reduces all, filters: [
    ->(player:) { where(player_id: player) },
    ->(training:) { where(training_id: training) }
  ]
end