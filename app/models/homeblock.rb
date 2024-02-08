# frozen_string_literal: true

class Homeblock < ApplicationRecord
  validates :role, presence: true, inclusion: { in: %w[candidate player trainer manager admin new] }
end
