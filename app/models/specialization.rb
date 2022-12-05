class Specialization < ApplicationRecord
  has_and_belongs_to_many :freelancers, dependent: :destroy

  validates :name, presence: true
end
