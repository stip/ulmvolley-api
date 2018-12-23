class PlayerSerializer < ActiveModel::Serializer
  attributes :name, :nick, :birthday
  has_many :trainings
end