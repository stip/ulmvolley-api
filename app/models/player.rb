require 'rack/reducer'

# the central entity in this app. A Volleyball player with all his facilities :)
class Player < ApplicationRecord
  extend Rack::Reducer

  validates_presence_of :name

  has_many :attendances
  has_many :trainings, through: :attendances

  reduces all, filters: [
    ->(name:) { where('lower(name) like ?', "%#{name.downcase}%") }
  ]

end
