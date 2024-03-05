# frozen_string_literal: true

class LessonSerializer < ActiveModel::Serializer
  attributes :date, :place, :description, :freebie, :name, :time, :status, :id

  has_many :lesson_rewards
  belongs_to :academy
end
