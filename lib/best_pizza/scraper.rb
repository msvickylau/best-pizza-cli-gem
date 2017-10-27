class BestPizza::Scraper 

	def self.scrape_pizza
		doc = Nokogiri::HTML(open("https://www.thrillist.com/eat/new-york/the-best-pizza-in-new-york-city"))

		doc.css("section.save-venue.saveable-venue").collect do |info| 
			restaurant = BestPizza::Restaurant.new
			restaurant.name = info.css('h1').text.strip
			restaurant.area = info.css('h2').text.strip
			restaurant.description = info.css('p.save-venue__description').text.strip
		
			restaurant
		end
	end

end