class Freelancer < ApplicationRecord
  has_many :users, through: :reservations
  has_and_belongs_to_many freelancer, dependent: :destroy

  validates :name, presence: true
  validates :photo, presence: true
  validates :details, presence: true
  validates :fee, presence: true
  validates :location, presence: true
  validates :specialization, presence: true
end
