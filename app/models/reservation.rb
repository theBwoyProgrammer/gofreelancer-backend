class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :freelancer

  validates :appointment_date, presence: true
end
