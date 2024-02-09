# frozen_string_literal: true

# spec/factories/leagues.rb
FactoryBot.define do
  factory :league do
    name { 'League Name' }
    edition_number { 1 }
    package { 'Standard Package' }
    price { 100 }
    status { 'upcoming' }
    date { '2023-01-01' }
    classification { 'Open' }
    image_url { 'http://example.com/image.png' }
  end
end
