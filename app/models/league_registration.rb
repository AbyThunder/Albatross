# frozen_string_literal: true

class LeagueRegistration < ApplicationRecord
  belongs_to :league
  belongs_to :user # the player
  # other attributes - perhaps a 'current' flag or timestamps to indicate active periods
end
