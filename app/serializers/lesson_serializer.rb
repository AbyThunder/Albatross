# frozen_string_literal: true

class LessonSerializer
  include FastJsonapi::ObjectSerializer
  attributes :date, :place, :description, :freebie

  belongs_to :academy
end
