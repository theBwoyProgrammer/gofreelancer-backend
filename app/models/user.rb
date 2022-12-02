class User < ApplicationRecord
  has_many :freelancers, through: :reservations

  validates :name, presence: true
end
