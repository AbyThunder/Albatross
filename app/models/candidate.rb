class Candidate < ApplicationRecord
  belongs_to :academy
  has_and_belongs_to_many :lessons

  enum status: { applied: 0, unqualified: 1, qualified: 2 }
end