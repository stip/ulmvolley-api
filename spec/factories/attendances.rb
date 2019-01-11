FactoryBot.define do
  factory :attendance do
    player
    training
    participant { nil }
    reason { nil }
  end
end