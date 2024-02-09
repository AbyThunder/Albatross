# frozen_string_literal: true

class Round < ApplicationRecord
  belongs_to :tournament

  has_many :round_results,  dependent: :destroy
  has_many :round_contests, dependent: :destroy
  has_many :flights,        dependent: :destroy

  validates :date, presence: true
  validates :description, length: { maximum: 500 }, allow_blank: true
  validates :place, presence: true, length: { maximum: 255 }
  validates :golf_course, presence: true, length: { maximum: 255 }
  validates :num_rounds, numericality: { only_integer: true, greater_than: 0 }, presence: true
  validates :hcp, length: { maximum: 100 }, allow_blank: true
  validates :criteria, length: { maximum: 500 }, allow_blank: true
end
