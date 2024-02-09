# frozen_string_literal: true

class LessonSerializer < ActiveModel::Serializer
  attributes :date, :place, :description, :freebie

  belongs_to :academy
end
