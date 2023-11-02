class Tournament < ApplicationRecord
  belongs_to :league
  has_many :rounds
  has_many :players
  has_many :tournament_results
  has_many :tournament_rewards
  has_many :tournament_sponsors

  enum status: { upcoming: 'upcoming', ongoing: 'ongoing', completed: 'completed' }
end
