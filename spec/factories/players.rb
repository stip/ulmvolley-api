FactoryBot.define do
	factory :player do
		name { Faker::name }
		nick { Faker::Name.first_name}
		birthday { Faker::Date.birthday(15,35) }
	end
end