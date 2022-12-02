class User < ApplicationRecord
  has_many :freelancers, through: :reservations
end
