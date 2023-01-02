class Freelancer < ApplicationRecord
  has_many :users, through: :reservations
  has_many :reservations, dependent: :destroy
  has_and_belongs_to_many :specializations, dependent: :destroy
  has_one_attached :featured_image

  validates :name, presence: true
  validates :photo, presence: true
  validates :details, presence: true
  validates :fee, presence: true
  validates :location, presence: true
end
