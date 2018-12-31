# frozen-string-literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Training.delete_all

schedule = IceCube::Schedule.new(start = Time.now, end_time: start + 7200) do |s|
  s.add_recurrence_rule IceCube::Rule.weekly.day(:tuesday, :friday).count(17)
end

trainings = []
schedule.each_occurrence do |o|
  trainings << Training.create(at: o.start_time.to_s).id
end

Player.delete_all
Attendance.delete_all

20.times do
  nick = Faker::Name.unique.female_first_name
  name = nick + ' ' + Faker::Name.last_name
  birthday = Faker::Date.birthday(15, 30)
  player = Player.create(name: name, nick: nick, birthday: birthday)
  chosen = []
  10.times do
    training = trainings[rand(Training.all.size)]
    next if chosen.include?(training)
    chosen << training
    attendance = Attendance.new(player: player, training: Training.find(training))
    attendance.presence = :no
    attendance.reason = Faker::HeyArnold.quote
    attendance.save
  end
end