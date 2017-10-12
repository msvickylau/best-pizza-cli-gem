class BestPizza::Resturant

	attr_accessor :name, :description, :area

	@@pizza_restaurants = []


	def self.pizza_restaurants
		@@pizza_restaurants
	end

	# def self.scrape_details
	# 	pizzas = []
	# 	pizzas << self.scrape_pizza
	# 	pizzas
	# end

	def self.scrape_pizza
		doc = Nokogiri::HTML(open("https://www.tripsavvy.com/best-pizza-in-new-york-city-1613413"))

		doc.css('li.ordered-list__item').collect do |info| 
			pizza = self.new
		  pizza.name = info.css('h3.ordered-list__header').text.strip
		  pizza.description = info.css('div.inline-chop_2-0').text.strip
		  
			
			# pizza.area || = info.xpath("//*[@id="inline-chop_2-0-2"]/ul/li[1]").text.strip
			self.pizza_restaurants << pizza
		end
	end

	 def self.find(id)
    self.pizza_restaurants[id.to_i - 1]
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