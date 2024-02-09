# frozen_string_literal: true

# spec/factories/academy.rb
FactoryBot.define do
  factory :academy do
    name { 'Academy Name' }
    season { '2023 Spring' }
    package { 'Standard Package' }
    edition_number { 'Edition 1' }
    status { 'upcoming' }
    image_url { 'http://example.com/image.png' }
  end
end
