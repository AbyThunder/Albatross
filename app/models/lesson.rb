class Lesson < ApplicationRecord
  belongs_to :academy
  has_and_belongs_to_many :users
  has_many :trainers_lessons
  has_many :trainers, through: :trainers_lessons, class_name: 'Trainer'
  has_many :lesson_rewards

  def candidates
    users.where(role: User.roles[:candidate])
  end
end