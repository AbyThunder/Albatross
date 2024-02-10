# frozen_string_literal: true

FactoryBot.define do
  factory :round do
    association :tournament
    date { Time.zone.today }
    description { 'Round Description' }
    place { 'Round Place' }
    golf_course { 'Golf Course Name' }
    num_rounds { 1 }
    hcp { 'Handicap' }
    criteria { 'Round Criteria' }
  end
end
