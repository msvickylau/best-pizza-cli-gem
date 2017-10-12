class BestPizza::Resturant

	attr_accessor :name, :description, :area, :address, :telephone, :neighborhood

	@@pizza_restaurants = []

	def self.pizza_restaurants
		@@pizza_restaurants
	end

	def self.scrape_pizza
		doc = Nokogiri::HTML(open("https://www.tripsavvy.com/best-pizza-in-new-york-city-1613413"))

		doc.css('li.ordered-list__item').collect do |info| 
			pizza = self.new
		  pizza.name = info.css('h3.ordered-list__header').text.strip
		  pizza.description = info.css('p').text.strip
		  pizza.address = info.css('ul/li[1]').text
		  pizza.telephone = info.css('ul/li[2]').text
		  pizza.neighborhood = info.css('ul/li[3]').text
			
			# pizza.area || = info.xpath("//*[@id="inline-chop_2-0-2"]/ul/li[1]").text.strip
			self.pizza_restaurants << pizza
		end
	end

	 def self.find(id)
    self.pizza_restaurants[id.to_i - 1]
  end
end
