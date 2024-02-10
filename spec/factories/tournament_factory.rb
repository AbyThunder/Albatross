# frozen_string_literal: true

FactoryBot.define do
  factory :tournament do
    association :league
    date { Time.zone.today }
    place { 'Tournament Place' }
    name { 'Tournament Name' }
    num_rounds { 1 }
    cost { 100 }
    additional_costs { 20 }
    formula { 'Formula' }
    package { 'Standard Package' }
    min_players { 10 }
    max_players { 100 }
    hcp { 'Handicap' }
    holes { 18 }
    additional_information { 'Additional Information' }
    time { '09:00' }
    gen_classification { 'General Classification' }
    image_url { 'http://example.com/image.png' }
    status { 'upcoming' }
  end
end
