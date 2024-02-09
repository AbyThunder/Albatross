# frozen_string_literal: true

class League < ApplicationRecord
  has_many :tournaments,          dependent: :destroy
  has_many :league_sponsors,      dependent: :destroy
  has_many :league_rewards,       dependent: :destroy

  enum status: { upcoming: 'upcoming', ongoing: 'ongoing', completed: 'completed' }

  validates :name, presence: true, length: { maximum: 100 }
  validates :edition_number, presence: true, numericality: { only_integer: true }
  validates :package, presence: true, length: { maximum: 100 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :date, presence: true
  validates :classification, length: { maximum: 100 }
end
