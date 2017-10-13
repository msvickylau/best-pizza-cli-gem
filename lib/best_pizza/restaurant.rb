class BestPizza::Restaurant

	attr_accessor :name, :description, :area,
	
	@@pizza_restaurants = []

	def self.pizza_restaurants
		@@pizza_restaurants
	end

	def self.scrape_pizza
		doc = Nokogiri::HTML(open("https://www.thrillist.com/eat/new-york/the-best-pizza-in-new-york-city"))

		doc.css("section.save-venue.saveable-venue").collect do |info| 
			pizza = self.new

			pizza.name = info.css('h1').text.strip
			pizza.area = info.css('h2').text.strip

		  pizza.description = info.css('p.save-venue__description').text.strip

			self.pizza_restaurants << pizza
		end
	end

	 def self.find(id)
    self.pizza_restaurants[id.to_i - 1]
  end
end
