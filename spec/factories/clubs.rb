FactoryBot.define do
  factory :club do
    name { Faker::Sports::Golf.course }
  end
end