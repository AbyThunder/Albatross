# frozen_string_literal: true

class AcademySerializer < ActiveModel::Serializer
  attributes :id
  attribute :name
  attribute :edition_number
  # attribute :image_url
  attribute :status, if: :is_index?
  attribute :package, if: :is_edit?
  attribute :season
  attribute :description, if: :is_edit?
  attribute :contact, if: :is_edit?

  has_many :academy_sponsors, if: :is_edit?
  has_many :lessons

  def is_index?
    instance_options[:is_index]
  end

  def is_edit?
    instance_options[:is_edit]
  end
end
