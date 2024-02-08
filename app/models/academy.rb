# frozen_string_literal: true

class Academy < ApplicationRecord
  has_one :schedule,          dependent: :destroy
  has_many :lessons,          dependent: :destroy
  has_many :academy_sponsors, dependent: :destroy

  enum status: { upcoming: 'upcoming', ongoing: 'ongoing', completed: 'completed' }
end
