lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative './lib/best_pizza/version'

Gem::Specification.new do |spec|
  spec.name          = 'best-pizza'
  spec.version       = BestPizza::VERSION
  spec.date          = '2017-10-18'
  spec.description   = %q{Best Pizza Restaurants in New York}
  spec.summary       = %q{This Ruby Gem provides a CLI to view the 26 best pizza resturants in New York as per thrillist website. Users can select from a list of pizza resturants and then view details and location.}

  spec.authors       = ['Vicky Lau']
  spec.email         = ['vlau.nyc@gmail.com']
  spec.homepage      = 'https://github.com/vlaunyc/best-pizza-cli-gem'

  spec.files         = ["lib/best_pizza.rb", "lib/best_pizza/cli.rb", "lib/best_pizza/restaurant.rb", "config/environment.rb"]
  spec.executables   = 'best-pizza'
  spec.license       = 'MIT'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "nokogiri","1.8.1"
end