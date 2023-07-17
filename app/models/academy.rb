class Academy < ApplicationRecord
  has_one :schedule
  has_many :candidates
  has_many :lessons
  has_and_belongs_to_many :sponsors
end