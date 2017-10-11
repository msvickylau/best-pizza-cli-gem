class BestPizza::Resturant

	attr_accessor :name, :description, :area

	def self.pizza_restaurants
		self.scrape_details
	end

	def self.scrape_details
		pizzas = []
		pizzas << self.scrape_pizza
		pizzas
	end

	def self.scrape_pizza
		doc = Nokogiri::HTML(open("https://www.timeout.com/newyork/restaurants/best-new-york-pizza"))

			doc.css('article.feature-item').collect do |info| 
				pizza = self.new
			  pizza.name = info.css('h3').text
			  pizza.description = info.css('p').text
			  pizza.area = info.css('div.listings_flags.xs-text-8').text.strip
				
				pizza
		end
	end
end

# def self.scrape_pizza
# 		doc = Nokogiri::HTML(open("http://www.refinery29.com/best-pizza-nyc"))
# # binding.pry
# 			doc.css(".section-outer-container").collect do |info|  #HOW DO I SPLIT THE RESTURANTS..?
# 				pizza = self.new
# 			  pizza.name = info.search("div.description strong").text.strip
				
# 				pizza
# 		end
# 	end
# end

# pizza.name = doc.css("div.description strong").each {|restaurant| puts restaurant.text.strip}