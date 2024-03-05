# frozen_string_literal: true

class LessonSerializer < ActiveModel::Serializer
  attributes :date, :place, :description, :freebie, :name, :time, :status

  belongs_to :academy
end
