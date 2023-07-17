class Candidate < ApplicationRecord
  belongs_to :academy
  has_and_belongs_to_many :lessons
end