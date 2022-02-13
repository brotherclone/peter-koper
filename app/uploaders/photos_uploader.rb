class PhotosUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
