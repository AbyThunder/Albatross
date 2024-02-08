# frozen_string_literal: true

class TournamentRewardSerializer < ActiveModel::Serializer
  attributes :condition, :sponsor, :prize
end
