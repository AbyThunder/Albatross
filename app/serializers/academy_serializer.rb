class AcademySerializer
  include FastJsonapi::ObjectSerializer
  attributes :edition_number, :package, :season

  has_many :lessons
  has_many :sponsors
end
