class AcademySerializer < ActiveModel::Serializer
  attributes :id, :name, :edition_number, :season, :status
end
