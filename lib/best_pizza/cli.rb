class BestPizza::CLI

	def call
		BestPizza::Resturant.scrape_pizza
		list_pizza
		menu
		repeat
	end

	def list_pizza
		puts ""
		puts "====================== Best New York Pizza ======================"
		puts ""
		@pizzas = BestPizza::Resturant.pizza_restaurants
		@pizzas.each.with_index(1) do |pizza, i|
			puts "#{i}. #{pizza.name}" #" -- #{restaurant.location}"
		end
	end

	def menu
		input = nil

		while input != "exit"
			puts ""
			puts "Which delicious pizza restaurant would you like more information on?"
			
			input = gets.strip.downcase
			# if input.to_i.between?(1,11)

			if input.to_i > 0 && input.to_i <= BestPizza::Resturant.pizza_restaurants.size
				restaurant = BestPizza::Resturant.find(input)
				# restaurant_card(restaurant)

				puts "================= #{pizza.name} ================="
				puts ""
				puts " #{pizza.description}"
				puts ""
				puts "------------------------------------------------------"
				puts ""
				puts " "
				puts " "
				puts ""

				repeat

			elsif input == "list"
				list_pizza
			elsif input == "exit"
				thanks
			else
				puts "Not sure what you're looking for, type 1-11, 'list', or 'exit'"
			end
		end		
	end

	def repeat
		puts ""
		puts "Would you like to see another restaurant? Enter Y or N"
		input = gets.strip.downcase
		if input == "y"
			call
		else 
			thanks
		end
	end

	def thanks 
		puts "Thanks! Enjoy your pizza!"
		exit
	end
end
