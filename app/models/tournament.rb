class Tournament < ApplicationRecord
  belongs_to :league
  has_many :rounds
  has_many :players
  has_many :results
  has_many :extra_contests
end
