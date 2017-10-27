class BestPizza::Controller

	@@pizza_restaurants = []

	def self.pizza_restaurants
		@@pizza_restaurants
	end

	def self.scrape_pizza
		@@pizza_restaurants = BestPizza::Scraper.scrape_pizza  #takes infomraiton from where the data is actaully scrapped and addes it to the array
	end

	def self.find(id)
 	 self.pizza_restaurants[id.to_i - 1]
  end

	def self.search_descriptions(keyword)													 	 #and return the resturant name if yes
 		pizza_restaurants.select{ |r| r.description.include?(keyword)} #.map { |r| r.name}
	end

end


# assignment: return the object if it contains the keyword.
# BestPizza::Controller.search_descriptions("doughy")
