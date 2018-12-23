require '/usr/local/lib/ruby/gems/2.5.0/gems/rack-reducer-0.1.2/lib/rack/reducer'

class Attendance < ApplicationRecord
  extend Rack::Reducer

  belongs_to :player
  belongs_to :training

  reduces all, filters: [
    ->(player:) { where(player_id: player ) },
    ->(training:) { where(training_id: training) }
  ]

end