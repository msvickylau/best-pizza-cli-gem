class BestPizza::Resturant

	attr_accessor :name, :description, :address, :telephone, :neighborhood, :subway, :span_one, :span_two
	
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

		# to avoid chop button, span class.... what else could be done for this..?
			pizza.span_one = info.css("ul/span/li[1]").text.strip
		  pizza.span_two = info.css("ul/span/li[2]").text.strip

		  # pizza.address_two = info.css('div[1]/ul/li[1]').text.strip
		  # pizza.telephone_two = info.css('div[1]/ul/li[2]').text.strip
		  # pizza.neighborhood_two = info.css('div[1]/ul/li[3]').text.gsub("(Map)", "").strip

		  # binding.pry

# How do you grab the second/third set of ul??? 
# when they're not organized in the same way depending on resturant...
# //*[@id="inline-chop_2-0"]/div[2]/ul/li[1]/text()
# //*[@id="inline-chop_2-0-2"]/ul/li[1]/text()
# //*[@id="inline-chop_2-0-3"]/ul/li[1]/text()
# //*[@id="inline-chop_2-0-8"]/ul
# //*[@id="inline-chop_2-0-9"]/ul[1]
# //*[@id="inline-chop_2-0-9"]/ul[2]

		  pizza.description = info.css('p').text.strip

			self.pizza_restaurants << pizza
		end
	end

	 def self.find(id)
    self.pizza_restaurants[id.to_i - 1]
  end
end
