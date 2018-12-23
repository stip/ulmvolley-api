# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Player.delete_all

20.times do
  nick = Faker::Name.unique.female_first_name
  puts nick
  name = nick + ' ' + Faker::Name.last_name
  puts name
  birthday = Faker::Date.birthday(15,30)
  puts birthday
  Player.create(name: name, nick: nick, birthday: birthday)
end

schedule = IceCube::Schedule.new(start = Time.now, end_time: start + 7200) do |s|
  s.add_recurrence_rule IceCube::Rule.weekly.day(:tuesday, :friday).count(17)
end


puts schedule.first.start_time.strftime("%y-%m-%d")



