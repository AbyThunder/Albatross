# frozen_string_literal: true

class AcademySponsorSerializer < ActiveModel::Serializer
  attributes :name, :image_url, :description
end
