def welcome
  a = Artii::Base.new :font => 'alligator2'
  b = Artii::Base.new :font => 'alligator'
  puts ""
  puts a.asciify('     we')
  puts ""
  puts b.asciify('           Fly')


  puts "\n \n Welcome to weFly."
  puts "\n Please enter your email address:"
  login
end

def login
  user_email = gets.chomp
  if !email_validator(user_email)
    puts "Please enter a valid email address."
    login
  end

  found_user = User.all.find_by(email: user_email)
  current = nil
  if !!found_user
    puts "Welcome back, #{found_user.name}!"
    puts "Here are your current reservations."
    user_reservations = Reservation.all.select do |current_user|
      current_user.user_id == found_user.id
    end #ends for selecting user's reservations
    i = 1
    user_flight = user_reservations.map do |res|
      res.flight.update(time: "#{rand(12...24)}:#{rand(0..59)}")
      res.flight.update(price: rand(200..900))
      res.flight.update(option: i)
      i += 1
      res.flight
    end

    # displaying User History
    puts ""
    tp user_flight, "airline", "flight_number", "origin", "destination", "airport"
    puts ""

    current = found_user
    if user_reservations.length != 0
      #each_loop(user_reservations)
      #insert new method here for user to choose 1 option from user_reservations
    elsif user_reservations.length == 0
      p "You do not have any current reservations."
    end


  else
    puts "I see it's the first time you are using weFly. \n Please provide your full name:"
    user_name = gets.chomp
    new = User.create(name: user_name, email: user_email)
    current = new
    puts "Welcome #{new.name}! How can we help you?"
  end

  puts "Are you here to book a new flight? Yes/No"
  choose_options(current)
end # end of logiN


def choose_options(current)
  input = gets.chomp
  if input != "yes" && input != "no"
    puts "please enter a valid response: yes/no"
#    binding.pry
    choose_options(current)
  elsif input == "no"
    # we need the name to display the reservation
    puts "Okay, we'll see you next time."
  elsif input == "yes"
    get_user_input(current)
  end
end

def get_user_input(current)
  #gets c or f from user
  puts "Please enter the city or the country you want to fly to:"
  city_country = gets.chomp

  # find the flight that match the city or the country
  found_options = Flight.where("destination like ?", "%#{city_country}%")

  #if found options = empty array, return

    if found_options.length == 0
      puts "Sorry, weFly does not travel to that location."
      get_user_input
    else
    i = 1
    serialed_option = found_options.map do |res|
      res.update(time: "#{rand(12...24)}:#{rand(0..59)}")
      res.update(price: rand(200..900))
      res.update(option: i)
      i += 1
      res
    end
  end

  puts ""
  tp serialed_option, "option", "airline", "flight_number", "origin", "destination", "airport", "price", "time"
   puts ""
  #each_loop(found_options)
  puts "Please indicate the option number of the flight you want to book:"
  make_reservation(serialed_option, current)
end


def make_reservation(serialed_option, current)
  choice = gets.chomp.to_i
  if choice.between?(1, serialed_option.length)#!!serialed_option[choice.to_i - 1] &&
    Reservation.create(user_id: current.id, flight_id: serialed_option[choice.to_i - 1].id)
    puts "Reservation confirmed! Congratulations. We look forward to flying with you."
    puts "Would you like to book another flight? Please enter 'yes' or 'no':"
    another = gets.chomp
    if another != "yes" && another != "no"
    elsif another == "yes"
      get_user_input
    elsif another == "no"
      puts "Thank you for booking with weFly."
    end
  else
    puts "Choice Not Valid, please try again"
    make_reservation(serialed_option, current)
  end
end




  ######################### HELPER METHODS #####################

  #EMAIL VALIDATOR
  def email_validator(user_email)
    EmailValidator.regexp
    EmailValidator.valid?(user_email)
  end

# def each_loop(arg)
#   i = 1
#   # puts "------------------------------------------------------------"
#   puts ""
#   tp arg
#   puts ""
  # arg.each do |option|
  #    option
  #   #puts "#{i}.  #{option}"
  #   i+= 1
  # end
  # puts "------------------------------------------------------------"
#end
