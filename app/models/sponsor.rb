class Sponsor < ApplicationRecord
  has_and_belongs_to_many :academies
end
