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

# xlsx = Roo::Excelx.new(File.expand_path('./bin/airportcodes.xlsx'))
# xlsx.each_row_streaming(offset: 1) do |row|
#   AirportCode.find_or_create_by(
#     city: row[0].value,
#     airportcode: row[1].value
#   )
# end

# welcome
# get_user_input
puts "HELLO WORLD"
