FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    phone { "123-456-7890" }
    address { Faker::Address.street_address }
    status { :applied }
    email { Faker::Internet.email }
    password { "password123" }
    password_confirmation { "password123" }
  end
end
