class Link < ActiveRecord::Base
	belongs_to :user
	enum link_type: [:simple_url, :video_url, :image_url]

	before_save :scrap_title_description_image
	before_update :scrap_title_description_image

	def scrap_title_description_image
		scrape = Grabbit.url(self.url)
		self.title = scrape.title
		self.description = scrape.description
		self.image_url = scrape.images.first
	end
end
