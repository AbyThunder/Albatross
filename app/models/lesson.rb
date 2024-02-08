# frozen_string_literal: true

class Lesson < ApplicationRecord
  belongs_to :academy

  has_and_belongs_to_many :users # rubocop:disable Rails/HasAndBelongsToMany

  has_many :trainers_lessons,   dependent: :destroy
  has_many :trainers,           class_name: 'Trainer',
                                through: :trainers_lessons,
                                dependent: :destroy
  has_many :lesson_rewards,     dependent: :destroy

  def candidates
    users.where(role: User.roles[:candidate])
  end
end
