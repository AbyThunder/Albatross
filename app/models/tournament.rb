# frozen_string_literal: true

class Tournament < ApplicationRecord
  belongs_to :league
  has_many :rounds,              dependent: :destroy
  has_many :tournament_results,  dependent: :destroy
  has_many :tournament_rewards,  dependent: :destroy
  has_many :tournament_sponsors, dependent: :destroy

  enum status: { upcoming: 'upcoming', ongoing: 'ongoing', completed: 'completed' }

  validates :date, :place, :name, :num_rounds, :cost, :min_players, :max_players, :holes, presence: true
  validates :name, length: { maximum: 100 }
  validates :place, length: { maximum: 255 }
  validates :package, length: { maximum: 255 }
  validates :hcp, length: { maximum: 50 }
  validates :additional_information, length: { maximum: 500 }, allow_blank: true
  validates :num_rounds, :cost, :additional_costs, :min_players, :max_players,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :holes, numericality: { only_integer: true, greater_than: 0 }
  validates :formula, :gen_classification, :time, length: { maximum: 100 }, allow_blank: true
end
