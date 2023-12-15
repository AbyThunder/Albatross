class LeagueSerializer < ActiveModel::Serializer
  attributes :id
  attribute :name
  attribute :edition_number
  attribute :date
  attribute :image_url
  attribute :status, if: :is_index?
  attribute :package, if: :is_edit?
  attribute :classification, if: :is_edit?
  attribute :price, if: :is_edit?

  has_many :league_sponsors, if: :is_edit?
  has_many :league_rewards, if: :is_edit?

  def is_index?
    instance_options[:is_index]
  end

  def is_edit?
    instance_options[:is_edit]
  end
end
