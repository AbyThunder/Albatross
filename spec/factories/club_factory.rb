# frozen_string_literal: true

FactoryBot.define do
  factory :club do
    name { Faker::Company.name }
    address { Faker::Address.full_address }
  end
end
