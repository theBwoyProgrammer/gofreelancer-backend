class FreelancerSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :details, :fee, :location, :photo, :featured_image, :specializations
  def featured_image
    { url: rails_blob_url(object.featured_image) } if object.featured_image.attached?
  end

  def specializations
    object.specializations.pluck(:name)
  end
end
