class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { 
    admin: 'admin', 
    manager: 'manager', 
    trainer: 'trainer', 
    player: 'player', 
    candidate: 'candidate', 
    applied: 'applied', 
    unqualified_candidate: 'unqualified_candidate'
  }

  belongs_to :academy, optional: true
  belongs_to :league_registration, optional: true
  has_and_belongs_to_many :clubs
  has_and_belongs_to_many :lessons#, -> { where(role: :candidate) }
end
