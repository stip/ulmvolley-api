require '/usr/local/lib/ruby/gems/2.5.0/gems/rack-reducer-0.1.2/lib/rack/reducer'

class Training < ApplicationRecord
  extend Rack::Reducer

  validates :at, presence: true

  has_many :attendances
  has_many :players, through: :attendances

  reduces all, filters: [
    ->(at:) { where(at: at) }
  ]

end