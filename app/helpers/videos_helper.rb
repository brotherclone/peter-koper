module VideosHelper
  def video_id(file_url)
    split = file_url.split('/')
    split.last
  end
end