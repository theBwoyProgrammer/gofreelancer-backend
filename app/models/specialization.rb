class Specialization < ApplicationRecord
  has_and_belongs_to_many :freelancers

  validates :name, presence: true
end
