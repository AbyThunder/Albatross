# frozen_string_literal: true

class League < ApplicationRecord
  has_many :tournaments,          dependent: :destroy
  has_many :league_registrations, dependent: :destroy
  has_many :users,                class_name: 'User',
                                  through: :league_registrations,
                                  dependent: :destroy
  has_many :league_sponsors,      dependent: :destroy
  has_many :league_rewards,       dependent: :destroy

  enum status: { upcoming: 'upcoming', ongoing: 'ongoing', completed: 'completed' }
end
