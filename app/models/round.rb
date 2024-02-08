# frozen_string_literal: true

class Round < ApplicationRecord
  belongs_to :tournament
  has_many :round_results
  has_many :round_contests
  has_many :flights
end
