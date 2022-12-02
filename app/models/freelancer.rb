class Freelancer < ApplicationRecord
  has_many :users, through: :reservations
  has_and_belongs_to_many freelancer, dependent: :destroy
end
