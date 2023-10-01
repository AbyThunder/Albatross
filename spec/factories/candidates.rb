# spec/factories/candidates.rb
FactoryBot.define do
  factory :candidate do
    name { "John Doe" }
    email { "john.doe@example.com" }
    phone { "123-456-7890" }
    status { "applied" }
    association :academy
  end
end
