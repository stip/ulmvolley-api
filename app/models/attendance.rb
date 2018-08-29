class Attendance < ApplicationRecord

  belongs_to :player
  belongs_to :training
end