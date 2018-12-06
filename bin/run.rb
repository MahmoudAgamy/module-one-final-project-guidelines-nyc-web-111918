require_relative '../config/environment'

require_relative '../lib/user.rb'
require_relative '../lib/reservation.rb'
require_relative '../lib/flight.rb'
require_relative '../lib/destination.rb'
require_relative '../lib/airport.rb'

require 'rest-client'
require 'json'
require 'pry'
require 'roo'
require 'artii'
require 'colorize'


#imports excel file data to :flights table
# xlsx = Roo::Excelx.new(File.expand_path('./bin/flights-app.xlsx'))
# # puts xlsx
# xlsx.each_row_streaming(offset: 1) do |row|
#   Flight.find_or_create_by(
#     airport: row[0],
#     airline: row[1],
#     duration: row[2],
#     flight_number: row[3]
#   )
# end


#imports excel file data to :airportcodes
# xlsx = Roo::Excelx.new(File.expand_path('./bin/airport-codes.xlsx'))
# xlsx.each_row_streaming(offset: 1) do |row|
#   AirportCode.find_or_create_by(
#     city: row[0].value,
#     airportcode: row[1].value
#   )
# end


# Flight.all.each do |f|
#   found = AirportCode.all.find do |ac|
#     ac.airportcode == f.airport
#   end
#   # binding.pry
#   if !!found
#     f.update_column(:city, found.city)
#   end
# end


# Flight.all.map do |res|
#   res.update(time: "#{rand(12...24)}:#{rand(10..59)}")
#   res.update(price: rand(200..900))
#   res
# end

welcome
# get_user_input
puts "Thank you for using weFly." #add an airplane
