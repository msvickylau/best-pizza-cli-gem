require 'pry'
class BestPizza::CLI

	def call
		BestPizza::Controller.scrape_pizza
		# binding.pry
		list_pizza
		menu
	end

	def list_pizza
		puts ""
		puts "================================================="
		puts "               Best New York Pizza "
		puts "================================================="
		@restaurants = BestPizza::Controller.pizza_restaurants
		@restaurants.each.with_index(1) do |restaurant, i|
			puts "#{i}. #{restaurant.name}" 	
		end
		puts "-------------------------------------------------"
	end

	def menu
		input = nil
		while input != "exit"
			puts "Which delicious pizza restaurant would you like more information on?"
			
			input = gets.strip.downcase

			if input.to_i.between?(1, 26)
				restaurant = BestPizza::Controller.find(input)
				puts ""
				puts "================================================="
				puts "             **   #{restaurant.name}   **"
				puts "================================================="
			 	puts "Neighborhood:   #{restaurant.area}"
				puts "-------------------------------------------------"
				puts "Description:    #{restaurant.description}"
				puts "-------------------------------------------------"
				repeat

			elsif input == "list"
				list_pizza
			elsif input == "exit"
				thanks
			else
				puts "Not sure what you're looking for, type 1-26, 'list', or 'exit'"
			end
		end		
	end

	def repeat
		puts ""
		puts "Would you like to see another restaurant? Enter Y or N"
		input = gets.strip.downcase
		if input == "y"
			list_pizza
		else
			thanks
		end
	end

	def thanks 
		puts "Thanks! Enjoy your pizza!"
		exit
	end
end