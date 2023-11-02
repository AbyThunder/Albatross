class TournamentSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :status

  attribute :league do
    { name: object.league&.name }
  end
end
