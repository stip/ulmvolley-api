FactoryBot.define do

  factory :player do
    name { Faker::name }
    nick { Faker::Name.first_name}
    birthday { Faker::Date.birthday(15,35) }

    trait :with_training do
      after(:create) do |player|

        player.trainings << create(:training)
      end
    end
  end
end