# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name { 'Doe' }
    phone { '+48883942316' }
    address { Faker::Address.street_address }
    email { Faker::Internet.email }
    password { 'password123' }
    password_confirmation { 'password123' }
    club
  end
end
