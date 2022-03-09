class VideoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
