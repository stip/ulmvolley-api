FactoryBot.define do
  factory :training do
    at { Faker::Time.forward(23) }
  end
end