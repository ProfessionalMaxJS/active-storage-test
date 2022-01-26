class ImageSerializer < ActiveModel::Serializer
  attributes :id, :caption, :pictured
  include Rails.application.routes.url_helpers#.rails_blob_url(only_path: true)

  def pictured
    if object.picture.attached?
      {
        url: rails_blob_url(object.picture)
      }
    end
  end
end
