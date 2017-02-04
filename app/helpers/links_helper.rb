module LinksHelper
	def get_video_link(url)
		video = VideoPlayer::player(url,"291", "200", false)
		video.html_safe
	end
end
