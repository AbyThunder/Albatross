class Player < ApplicationRecord
  belongs_to :league
  belongs_to :tournament
end