class User < ApplicationRecord
  has_many :freelancers, through: :reservations
  has_many :reservations
  validates :name, presence: true
end
