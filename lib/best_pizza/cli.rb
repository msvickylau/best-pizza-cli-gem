class BestPizza::CLI

	def call
		BestPizza::Resturant.scrape_pizza
		list_pizza
		menu
		repeat
	end

	def list_pizza
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

			if input.to_i.between?(1,87)
				@resturant = BestPizza::Resturant.find(input.to_i)
				resturant_card
			elsif input == "exit"
				thanks
			else
				puts "Not sure what you're looking for, type 1-87 or 'exit'"
			end
		end		
	end

	def resturant_card
		puts "================= #{pizza.name} ================="
		puts ""
		puts " #{pizza.description}"
		puts ""
		puts "------------------------------------------------------"
		puts ""
		puts " "
		puts "  AREA: 					#{pizza.area}"
		puts ""

		repeat
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
