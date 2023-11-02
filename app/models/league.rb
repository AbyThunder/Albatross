class League < ApplicationRecord
  has_many :tournaments
  has_many :league_registrations
  has_many :users, through: :league_registrations
  has_many :general_classifications
  has_many :other_classifications
  has_many :league_sponsors

  enum status: { upcoming: 'upcoming', ongoing: 'ongoing', completed: 'completed' }
end
