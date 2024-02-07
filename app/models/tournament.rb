class Tournament < ApplicationRecord
  belongs_to :league
  has_many :rounds
  has_many :tournament_registrations
  has_many :users, through: :tournament_registrations
  has_many :tournament_results
  has_many :tournament_rewards
  has_many :tournament_sponsors

  enum status: { upcoming: 'upcoming', ongoing: 'ongoing', completed: 'completed' }
end
