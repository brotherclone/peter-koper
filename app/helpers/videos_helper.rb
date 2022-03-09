module VideosHelper
  def video_id(file_url)
    file_url.to_s.match /([^\/]+)(?=\.\w+$)/
  end
end