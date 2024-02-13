# frozen_string_literal: true

class User < ApplicationRecord
  self.inheritance_column = 'type'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status: {
    draft: 0,
    processing: 10,
    approved: 20,
    refused: 30
  }

  belongs_to :club

  validates :first_name, :last_name, presence: true, length: { maximum: 50 }
  validates :phone, phone: true, allow_blank: true
  validates :status, inclusion: { in: User.statuses.keys }
end
