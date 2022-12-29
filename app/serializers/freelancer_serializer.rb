class FreelancerSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :details, :fee, :location, :photo, :featured_image, :specializations
  def featured_image
    return unless object.featured_image.attached?

    {
      url:  Rails.application.routes.default_url_options[:host] + rails_blob_url(object.featured_image)
    }
  end

  def specializations
    object.specializations.pluck(:name)
  end
end
