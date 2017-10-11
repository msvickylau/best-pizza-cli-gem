class BestPizza::Scraper

	# def self.scrape
	# 	doc = Nokogiri::HTML(open("http://www.refinery29.com/best-pizza-nyc"))

	# 	binding.pry	
	# end

# 	x = doc.search("").text

# 	# ===============


	# def get_webpage
	# 	Nokogiri::HTML(open("http://www.refinery29.com/best-pizza-nyc"))
	# end

	# def scrape_restaurant_index
	# 	self.get_webpage.css("span.mobile-slide-indicator span.data-reactid")
	# end

	# def make_restaurants
	# 	scrape_restaurant_index.each do |res|
	# 		BestPizza::Resturant.pizza_from_index(res)
	# 	end
	# end
end


# get resturant name
# doc.css("div.tiles h3.xs-text-5").each {|restaurant| puts restaurant.text.strip}

# restaurant index
# counter = doc.search("div.feature-item__count").text