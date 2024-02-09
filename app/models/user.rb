# frozen_string_literal: true

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
    candidate: 'candidate'
  }

  enum status: {
    applied: 'applied',
    unqualified_candidate: 'unqualified_candidate',
    qualified_candidate: 'qualified_candidate',
    unqualified_player: 'unqualified_player',
    qualified_player: 'qualified_player'
  }

  belongs_to :academy, optional: true
  belongs_to :league_registration, optional: true
  # has_and_belongs_to_many :clubs
  has_and_belongs_to_many :lessons # rubocop:disable Rails/HasAndBelongsToMany

  validates :first_name, :last_name, presence: true, length: { maximum: 50 }
  validates :phone, phone: true, allow_blank: true
end
