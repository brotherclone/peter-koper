module VideosHelper

  def get_id_from_link(link, video_service)
    if video_service == "vimeo"
      v = link.split("/")
      puts v.to_s
      puts v.last
      v.last
    end
  end

end