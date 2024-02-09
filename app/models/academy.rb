# frozen_string_literal: true

class Academy < ApplicationRecord
  has_many :lessons,          dependent: :destroy
  has_many :academy_sponsors, dependent: :destroy

  enum status: { upcoming: 'upcoming', ongoing: 'ongoing', completed: 'completed' }

  validates :name, length: { maximum: 100 }, presence: true
  validates :season, length: { maximum: 100 }, presence: true
  validates :package, length: { maximum: 200 }, presence: true
  validates :edition_number, length: { maximum: 100 }, presence: true
end
