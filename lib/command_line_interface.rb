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
  user_email = gets.chomp.downcase
  if !email_validator(user_email)
    puts "Please enter a valid email address."
    login
  end

  found_user = User.all.find_by(email: user_email)
  current = nil
  sleep(1)
#beginning of found user
  if !!found_user
      puts "Welcome back, #{found_user.name}!"
      puts "Here are your current reservations."
      sleep(1)
      # user_reservations = found_user.flights
      #
      # i = 1
      # user_flight = user_reservations.map do |res|
      #   res.update(option: i)
      #   i += 1
      #   res
      #end


      current = found_user

    if current.flights.length != 0
        # displaying User History
        puts ""
        tp current.flights, "airline", "flight_number", "origin", "destination", "airport"
        puts ""

        main_menu(current)

    elsif user_reservations.length == 0
        puts "You do not have any current reservations."
    end

#end of found user
#beginning of new user
  else
    puts "I see it's the first time you are using weFly.\nPlease provide your full name:"
    user_name = gets.chomp
    new = User.create(name: user_name, email: user_email)
    current = new
    puts "Welcome #{new.name}! How can we help you?"
  end

end # end of logiN





def make_reservation(serialed_option, current)
  choice = gets.chomp.to_i
  if choice.between?(1, serialed_option.length)#!!serialed_option[choice.to_i - 1] &&
    Reservation.create(user_id: current.id, flight_id: serialed_option[choice.to_i - 1].id)
    sleep(1)
    puts "Congratulations! Your reservation is confirmed."
    puts "Ticket purchased using the card on file ending in #{rand(1000..9999)}."
    puts ""
    tp serialed_option[choice.to_i - 1], "airline", "flight_number", "origin", "destination", "airport", "price", "time"
    puts ""
    sleep(1)
    puts "We look forward to flying with you."
    sleep(1)
    puts "Would you like to book another flight? Please enter 'yes' or 'no':"
    another = gets.chomp
    if another != "yes" && another != "no"
    elsif another == "yes"
      booking
    elsif another == "no"
      puts "Thank you for booking with weFly."
      main_menu(current)
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


  def main_menu(current)
    sleep(2)
    puts "Please enter the keyword from the following options:"
    #main menu
    puts ""

    puts "  BOOK   - to book a new flight"
    puts "  VIEW   - to view my existing reservations"
    puts "  UPDATE - to update your information" # - add to user column #change gender to phone number
    puts "  CANCEL - to cancel your most recent reservation"
    puts "  EXIT   - to end your current session with weFly"
    puts ""

    keyword = gets.chomp.upcase
    sleep(1)
    keyword_response(keyword, current)
  end
  

def keyword_response(keyword, current)
  case keyword
  when "BOOK"
    booking(current)
  when "VIEW"
    puts ""
    tp current.flights, "airline", "flight_number", "origin", "destination", "airport"
    puts ""
  when "UPDATE"

  when "CANCEL"
    puts ""
    puts "Are you sure you want to cancel your last flight? (displayed below)"
    puts "'yes' or 'no'"
    puts ""
    tp current.flights.last,  "airline", "flight_number", "origin", "destination", "airport"
    puts ""
    canceled = gets.chomp.downcase
      if canceled == "yes"
        #user_email = current.email
        found_user = User.all.find_by(email: current.email)
        current = found_user
        current.reservations.last.destroy
        puts "Canceling your last reservation..."
        sleep(1)
        puts "You have successfully canceled your last flight."
        puts "Your card will be refunded in the next 3-5 business days."
        puts "Below is your updated current reservation history."
        puts ""
        tp current.flights, "airline", "flight_number", "origin", "destination", "airport"
        puts ""

        main_menu(current)
      elsif canceled == "no"
       puts "returning to main menu"
       main_menu(current)
      end
  when "EXIT"

  else
    puts "Please enter a valid response"
    keyword = gets.chomp.upcase
    sleep(1)
    keyword_response(keyword, current)
  end
end



def booking(current)
  puts "Please enter the city or the country you want to fly to:"
  city_country = gets.chomp.capitalize
  # find the flight that match the city or the country
  found_options = Flight.where("destination like ?", "%#{city_country}%")
  #if found options = empty array, return
    if found_options.length == 0
      puts "Sorry, weFly does not travel to that location."
      booking(current)
    else
    i = 1
    serialed_option = found_options.map do |res|
      res.update(option: i)
      i += 1
      res
    end
  end
  sleep(1)
  puts ""
  tp serialed_option, "option", "airline", "flight_number", "origin", "destination", "airport", "price", "time"
   puts ""
  #each_loop(found_options)
  puts "Please indicate the option number of the flight you want to book:"
  make_reservation(serialed_option, current)
end
