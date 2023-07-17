class League < ApplicationRecord
  has_many :tournaments
  has_many :players
  has_many :general_classifications
  has_many :other_classifications
  has_many :league_sponsors
end
