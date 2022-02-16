class AudioUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  resource :video
end
