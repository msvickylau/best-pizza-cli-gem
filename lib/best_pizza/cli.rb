class BestPizza::CLI

	def call
		list_restaurants
		menu
		repeat
	end

	def list_restaurants
		puts "====================== Best Pizza in New York ======================"
		puts ""
		@restaurants = BestPizza::Resturant.all

	end

	def menu
		input = nil
		while input != "exit"
			puts ""
			puts "What restaurant would you like more information on?"
			input = gets.strip.downcase

			if input.to_i > 0
				resturant_card
			elsif input == "exit"
				thanks
			else
				puts "Not sure what you're looking for, type 1-25 or 'exit'"
			end
		end		
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