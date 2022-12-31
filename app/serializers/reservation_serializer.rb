class ReservationSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :appointment_date, :city, :freelancer

  def freelancer
    freelancer = object.freelancer
    featured_image = featured_image(freelancer)
    { data:freelancer, featured_image: featured_image }
  end

  def featured_image(freelancer)
    return unless freelancer.featured_image.attached?

    {
      url: rails_blob_url(freelancer.featured_image)
    }
  end
end
