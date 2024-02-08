# frozen_string_literal: true

class Round < ApplicationRecord
  belongs_to :tournament

  has_many :round_results,  dependent: :destroy
  has_many :round_contests, dependent: :destroy
  has_many :flights,        dependent: :destroy
end
