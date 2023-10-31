class AcademySerializer
  include FastJsonapi::ObjectSerializer
  attributes :edition_number, :package, :season, :sponsor

  has_many :lessons
  has_many :sponsors
end
