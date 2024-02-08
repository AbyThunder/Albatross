# frozen_string_literal: true

class AcademySponsor < ApplicationRecord
  belongs_to :academies

  # validates :image_url, format: { with: URI::regexp(%w[http https]), message: 'must be a valid URL' }, allow_blank: true
end
