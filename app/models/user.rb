class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { admin: 0, manager: 1, trainer: 2, player: 3, candidate: 4, applied: 5, unqualified_candidate: 6}

  belongs_to :academy, optional: true
  belongs_to :league_registration, optional: true
  has_and_belongs_to_many :clubs
  has_and_belongs_to_many :lessons, -> { where(role: 'candidate') }
end
