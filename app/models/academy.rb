class Academy < ApplicationRecord
  has_one :schedule
  has_many :lessons
  has_many :academy_sponsors

  enum status: { upcoming: 'upcoming', ongoing: 'ongoing', completed: 'completed' }
end