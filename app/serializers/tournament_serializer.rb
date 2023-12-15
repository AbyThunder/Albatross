class TournamentSerializer < ActiveModel::Serializer
  attribute :league do
    { name: object.league&.name }
  end
  attribute :status, if: :is_index?
  attribute :id
  attribute :name
  attribute :date
  attribute :image_url
  attribute :place, if: :is_edit?
  attribute :time, if: :is_edit?
  attribute :num_rounds, if: :is_edit?
  attribute :holes, if: :is_edit?
  attribute :cost, if: :is_edit?
  attribute :package, if: :is_edit?
  attribute :additional_information, if: :is_edit?
  attribute :formula, if: :is_edit?
  attribute :hcp, if: :is_edit?
  attribute :min_players, if: :is_edit?
  attribute :max_players, if: :is_edit?
  attribute :gen_classification, if: :is_edit?
  #attribute :league_id, if: :is_edit?

  has_many :tournament_rewards, if: :is_edit?
  has_many :tournament_sponsors, if: :is_edit?

  def is_index?
    instance_options[:is_index]
  end
  def is_edit?
    instance_options[:is_edit]
  end
end
