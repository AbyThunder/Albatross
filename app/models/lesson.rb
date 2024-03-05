# frozen_string_literal: true

class Lesson < ApplicationRecord
  belongs_to :academy
  has_many :lesson_rewards, dependent: :destroy

  enum status: { upcoming: 'upcoming', ongoing: 'ongoing', completed: 'completed' }

  validates :name, presence: true, length: { maximum: 100 }
  validates :date, presence: true
  validates :time, presence: true
  validates :place, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 500 }
  validates :freebie, length: { maximum: 255 }, allow_blank: true
end
