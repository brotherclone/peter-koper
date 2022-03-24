module VideosHelper
  def video_id(file_url)
    file_url.to_s.match /([^\/]+)(?=\.\w+$)/
  end

  def show_cloud
    ENV["CLOUDINARY_CLOUD_NAME"]
  end
end