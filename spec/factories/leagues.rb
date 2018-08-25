FactoryBot.define do
	factory :league do
		name { Faker::LordOfTheRings.character }
		league_id { Faker::Number.number(4) }
	end
end