class BestPizza::CLI

	def call
		puts "Best Pizzas in New York City"
		list_restaurants
		menu
	end

	def list_restaurants
		puts "====================== Best Pizza in New York ======================"
		puts "  1.  restaurant name    -- location"
		puts "  2.  restaurant name    -- location"
	end

	def menu
		puts "What restaurant would you like more information on?"
		input = gets.strip.downcase

		resturant_card
	end

		

	def resturant_card
		puts "======================    restaurant name    ======================"
		puts "  Address:"
		puts "  Cross street:"
		puts "  Opening hours:"
		puts "  Transport:"
		puts "  Price:"
		puts "  telephone:"
		puts "  ------------------------ Description ------------------------"
		puts "  description....."
		puts ""
	end

	def thanks 
		puts "Thanks! Enjoy your pizza!"
	end

end