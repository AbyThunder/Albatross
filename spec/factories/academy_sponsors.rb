# frozen_string_literal: true

FactoryBot.define do
  factory :academy_sponsor do
    name { 'Sponsor Name' }
    image_url { 'http://example.com/sponsor.jpg' }
    description { 'Sponsor description.' }
    academy
  end
end
