module YoutubeHelper

  def videos_title(q)
    q.present? ? q.upcase : "VIDEOS RECOMENDADOS"
  end
end
