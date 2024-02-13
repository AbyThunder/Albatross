# frozen_string_literal: true

FactoryBot.define do
  factory :lesson do
    association :academy
    name { 'Lesson Name' }
    date { Time.zone.today }
    time { '10am' }
    place { 'Lesson Place' }
    description { 'Lesson Description' }
    freebie { 'Lesson Freebie' }
  end
end
