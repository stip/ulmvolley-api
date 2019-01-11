class AttendanceSerializer < ActiveModel::Serializer
  attributes :player_id, :training_id, :reason, :participant
end