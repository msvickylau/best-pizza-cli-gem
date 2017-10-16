
require "best_pizza/version"

Gem::Specification.new do |spec|
  spec.name          = 'best_pizza'
  spec.version       = BestPizza::VERSION
  spec.date          = '2017-10-15'
  spec.authors       = ["Vicky Lau"]
  spec.email         = 'vlau.nyc@gmail.com'

  spec.description   = "Best Pizzas in New York"
  spec.summary       = "This Ruby Gem provides a CLI to view the 11 best pizzas in New York as per tripsavvy website."
  spec.homepage      = "https://github.com/vlaunyc/best-pizza-cli-gem"
  spec.license       = "MIT"

  spec.files         = ["lib/best_pizza.rb", "lib/best_pizza/cli.rb", "lib/best_pizza/restaurant.rb", "config/environment.rb"]
  spec.executables   << 'best-pizza'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri", ">= 0"
end

