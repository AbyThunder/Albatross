# frozen_string_literal: true

class League < ApplicationRecord
  has_many :tournaments
  has_many :league_registrations
  has_many :users, through: :league_registrations
  has_many :league_sponsors
  has_many :league_rewards

  enum status: { upcoming: 'upcoming', ongoing: 'ongoing', completed: 'completed' }
end
