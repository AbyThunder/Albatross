# frozen_string_literal: true

class Lesson < ApplicationRecord
  belongs_to :academy
  has_and_belongs_to_many :users # rubocop:disable Rails/HasAndBelongsToMany
  has_many :lesson_rewards, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :date, presence: true
  validates :place, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 500 }
  validates :freebie, length: { maximum: 255 }, allow_blank: true
end
