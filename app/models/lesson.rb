class Lesson < ApplicationRecord
  belongs_to :academy
  has_and_belongs_to_many :candidates
  has_many :trainers_lessons
  has_many :trainers, through: :trainers_lessons
  has_many :competitions
end