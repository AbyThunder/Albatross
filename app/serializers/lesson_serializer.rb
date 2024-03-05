# frozen_string_literal: true

class LessonSerializer < ActiveModel::Serializer
  attributes :date, :place, :description, :freebie, :name, :time

  belongs_to :academy
end
