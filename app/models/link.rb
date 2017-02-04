class Link < ActiveRecord::Base
	belongs_to :user
	enum link_type: {:simple_url => 1, :video_url => 2, :image_url => 3}

	before_save :scrap_title_description_image

	def scrap_title_description_image
		scrape = Grabbit.url(self.url)
		self.title = scrape.title
		self.description = scrape.description
	end
end
