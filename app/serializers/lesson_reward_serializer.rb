# frozen_string_literal: true

class LessonRewardSerializer < ActiveModel::Serializer
  attributes :condition, :sponsor, :prize
end
