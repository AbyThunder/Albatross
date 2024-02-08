# frozen_string_literal: true

class LeagueSponsorSerializer < ActiveModel::Serializer
  attributes :name, :image_url, :description
end
