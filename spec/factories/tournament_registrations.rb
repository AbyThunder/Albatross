FactoryBot.define do
  factory :tournament_registration do
    user { nil }
    tournament { nil }
    status { "MyString" }
  end
end
