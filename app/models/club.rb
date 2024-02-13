# frozen_string_literal: true

# app/models/club.rb

class Club < ApplicationRecord
  has_many :users, dependent: :destroy
  # has_many :academies
  # has_many :leagues

  # Validation example: ensure presence of name and address
  validates :name, presence: true
  validates :address, presence: true

  # Other fields: contact_full_name, contact_phone_number
end
