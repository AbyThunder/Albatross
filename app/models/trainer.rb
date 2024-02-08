# frozen_string_literal: true

class Trainer < ApplicationRecord
  has_many :trainers_lessons, dependent: :destroy
  has_many :lessons,          class_name: 'Lesson',
                              through: :trainers_lessons,
                              dependent: :destroy
end
