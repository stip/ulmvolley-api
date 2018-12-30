require 'rack/reducer'

class Training < ApplicationRecord
  extend Rack::Reducer

  validates :at, presence: true

  has_many :attendances
  has_many :players, through: :attendances

  reduces all, filters: [
    ->(at:) { where(at: at) }
  ]

end