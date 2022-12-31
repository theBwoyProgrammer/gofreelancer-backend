class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :appointment_date, :city, :freelancer

  def freelancer
    object.freelancer
  end

  def featured_image(freelancer)
    return unless freelancer.featured_image.attached?

    {
      url: rails_blob_url(freelancer.featured_image)
    }
  end
end
