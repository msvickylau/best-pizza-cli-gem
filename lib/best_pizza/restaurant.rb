class BestPizza::Resturant

	attr_accessor :name, :description, :address, :address_two, :telephone, :telephone_two, :neighborhood, :neighborhood_two, :subway
	@@pizza_restaurants = []

	def self.pizza_restaurants
		@@pizza_restaurants
	end

	def self.scrape_pizza
		doc = Nokogiri::HTML(open("https://www.tripsavvy.com/best-pizza-in-new-york-city-1613413"))

		doc.css('li.ordered-list__item div.ordered-list__content').collect do |info| 
			pizza = self.new
		  pizza.name = info.css('h3.ordered-list__header').text.strip

		  pizza.address = info.css('ul/li[1]').text.strip
		  pizza.telephone = info.css('ul/li[2]').text.gsub("...MORE","").strip
		  pizza.neighborhood = info.css('ul/li[3]').text.gsub("(Map)", "").strip
		  pizza.subway = info.css('ul/li[4]').text.gsub("...MORE","").strip

		  pizza.address_two = info.css('div[1]/ul/li[1]').text.strip
		  pizza.telephone_two = info.css('div[1]/ul/li[2]').text.strip
		  pizza.neighborhood_two = info.css('div[1]/ul/li[3]').text.gsub("(Map)", "").strip
#How do you grab the second/third set of ul??? 

		  pizza.description = info.css('p').text.strip

			self.pizza_restaurants << pizza
		end
	end

	 def self.find(id)
    self.pizza_restaurants[id.to_i - 1]
  end
end
