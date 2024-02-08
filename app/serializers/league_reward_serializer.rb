# frozen_string_literal: true

class LeagueRewardSerializer < ActiveModel::Serializer
  attributes :condition, :sponsor, :prize
end
