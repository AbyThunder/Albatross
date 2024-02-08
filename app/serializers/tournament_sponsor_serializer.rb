# frozen_string_literal: true

class TournamentSponsorSerializer < ActiveModel::Serializer
  attributes :name, :image_url, :description
end
