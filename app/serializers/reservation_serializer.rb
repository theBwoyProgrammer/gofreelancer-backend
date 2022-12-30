class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :appointment_date, :city, :freelancer

  def freelancer
    object.freelancer
    object.freelancer.featured_image
  end

end
