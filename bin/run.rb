require_relative '../config/environment'

require_relative '../lib/user.rb'
require_relative '../lib/reservation.rb'
require_relative '../lib/flight.rb'
require_relative '../lib/destination.rb'
require_relative '../lib/airport.rb'

require 'rest-client'
require 'json'
require 'pry'

#def data
#  response_string = RestClient.get('https://airhob-api.p.mashape.com/sandboxapi/flights/v1.1/search')
#  results = JSON.parse(response_string)
#  puts results
#end
#data

# binding.pry
# def welcome
#   puts "Welcome to weFly."
#   puts "Are you looking for a city or flight? Please enter 'c' for city, or 'f' for flight."
#   get_user_input
# end
#
# def get_user_input
#   binding.pry
#   #gets c or f from user
#   #input = gets.chomp
#   if input.to_s != "c" || input.to_s != "f"
#     p "Please enter 'c' for city, or 'f' for flight."
#   #elsif input.to_s == "c"
#     #p "Please enter the name of the city you are flying to:"
#     #city = gets.chomp
#     #puts city.to_s
#     #User.first
#   #elsif input.to_s == "f"
#     #puts "Please enter the flight number:"
#     #flight = gets.chomp
#     #puts flight.to_s
#     #Flight.first
#   end
#   #will pass this as an argument for our next method: enter the city or flight name
#
# end

welcome
get_user_input
puts "HELLO WORLD"
