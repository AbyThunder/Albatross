# frozen_string_literal: true

class Trainer < ApplicationRecord
  has_many :trainers_lessons
  has_many :lessons, through: :trainers_lessons, class_name: 'Lesson'
end
