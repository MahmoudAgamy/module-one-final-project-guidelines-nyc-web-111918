def welcome
  puts "Welcome to weFly."
  puts "Are you looking for a city or flight? Please enter 'c' for city, or 'f' for flight."
end

def get_user_input
  #gets c or f from user
  input = gets.chomp
  if input != "c" && input != "f"
    puts "Please enter 'c' for city, or 'f' for flight."
  elsif input == "c"
    puts "Please enter the name of the city you are flying to:"
    city = gets.chomp
    city_meth(city)
  elsif input == "f"
    puts "Please enter the flight number:"
    flight = gets.chomp
    flight_meth(flight)
  end
  #will pass this as an argumemt for our next method: enter the city or flight name

end

def city_meth(city)
  puts User.all.first.name
  puts "done! #{city}"
end

def flight_meth(flight)
  puts Flight.all
  puts "done! #{flight}"
end
