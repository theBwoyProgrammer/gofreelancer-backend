class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :appointment_date, :city
end
