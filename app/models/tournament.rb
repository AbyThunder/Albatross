# frozen_string_literal: true

class Tournament < ApplicationRecord
  belongs_to :league
  has_many :rounds,              dependent: :destroy
  has_many :players,             dependent: :destroy
  has_many :tournament_results,  dependent: :destroy
  has_many :tournament_rewards,  dependent: :destroy
  has_many :tournament_sponsors, dependent: :destroy

  enum status: { upcoming: 'upcoming', ongoing: 'ongoing', completed: 'completed' }
end
