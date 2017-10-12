class BestPizza::CLI

	def call
		BestPizza::Resturant.scrape_pizza
		list_pizza
		menu
		repeat
		thanks
	end

	def list_pizza
		puts ""
		puts "================================================="
		puts "               Best New York Pizza "
		puts "================================================="
		@pizzas = BestPizza::Resturant.pizza_restaurants
		@pizzas.each.with_index(1) do |pizza, i|
			puts "#{i}. #{pizza.name}" 	
		end
		puts "-------------------------------------------------"
	end

	def menu
		input = nil

		while input != "exit"
			puts "Which delicious pizza restaurant would you like more information on?"
			
			input = gets.strip.downcase
			# if input.to_i.between?(1,11)

			if input.to_i > 0 && input.to_i <= BestPizza::Resturant.pizza_restaurants.size
				pizza = BestPizza::Resturant.find(input)
				puts ""
				puts "================================================="
				puts "                #{pizza.name}" 
				puts "================================================="
				puts "#{pizza.address}"
				puts "#{pizza.telephone}"
				puts "#{pizza.neighborhood}"
				puts "#{pizza.subway}"
				puts "#{pizza.span_one}"
				puts "#{pizza.span_two}"
				puts "-------------------------------------------------"
				puts "#{pizza.description}"
				puts "-------------------------------------------------"

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
