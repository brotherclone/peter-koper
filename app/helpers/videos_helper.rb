module VideosHelper

  def get_id_from_link(link, video_service)
    if video_service == "vimeo"
      v = link.split("/")
      puts v.to_s
      puts v.last
      v.last
    end
  end

  def get_aspect_ratio_class(aspect_ratio)
    case aspect_ratio
    when "sixteen_by_nine"
      "video-hd-sizing"
    when "nine_by_sixteen"
      "video-hd-vertical-sizing"
    when "four_by_three"
      "video-sd-sizing"
    else
      "video-hd-sizing"
    end
  end

end