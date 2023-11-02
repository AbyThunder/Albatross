class LeagueSerializer < ActiveModel::Serializer
  attributes :id, :name, :edition_number, :date, :status
end
