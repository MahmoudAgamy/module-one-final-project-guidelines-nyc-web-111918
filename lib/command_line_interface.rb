def welcome
  a = Artii::Base.new :font => 'alligator2'
  b = Artii::Base.new :font => 'alligator'
  puts ""
  puts a.asciify('     we')
  puts ""
  puts b.asciify('           Fly').colorize(:cyan)

  puts "\n \n Welcome to weFly.".colorize(:cyan)
  sleep 1
  puts "\n Please enter your email address:\n".colorize(:cyan)
  login
end

def login
  user_email = gets.chomp.downcase
  if !email_validator(user_email)
    puts "\nPlease enter a valid email address.\n".colorize(:cyan)
    login
  end

  found_user = User.all.find_by(email: user_email)
  current = nil
  sleep(1)
#beginning of found user
  if !!found_user
      puts "\nWelcome back, #{found_user.name}!\n".colorize(:cyan)
      sleep 0.5
      puts "\nHere are your current reservations.\n".colorize(:cyan)
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
      #main_menu(current)

    if current.flights.length != 0
        # displaying User History
        puts ""
        tp current.flights, "airline", "flight_number", "origin", "destination", "airport"
        puts ""

        main_menu(current)

    elsif current.flights.length == 0
        puts "\nYou do not have any current reservations.\n".colorize(:cyan)
        puts "Directing you back to the main menu.\n".colorize(:cyan)
        main_menu(current)
    end

#end of found user
#beginning of new user
  else
    sleep(1)
    puts "\n\nI see it's the first time you are using weFly.\nPlease provide your full name:".colorize(:cyan)
    user_name = gets.chomp
    new = User.create(name: user_name, email: user_email)
    current = new
    puts "\nWelcome #{new.name}! How can we help you?\n".colorize(:cyan)
    main_menu(current)
  end

end # end of logiN





def make_reservation(serialed_option, current)
  puts "  BACK - to enter a different destination.".colorize(:magenta)
  puts "  MENU - to go back to the main menu.".colorize(:magenta)
  choice = gets.chomp
  if choice.to_i.between?(1, serialed_option.length) #!!serialed_option[choice.to_i - 1] &&
    Reservation.create(user_id: current.id, flight_id: serialed_option[choice.to_i - 1].id)
    sleep(1)

    puts "\nCongratulations! Your reservation is confirmed.\n".colorize(:cyan)
    puts "Ticket purchased using the card on file ending in #{rand(1000..9999)}.\n".colorize(:cyan)
    puts ""
    tp serialed_option[choice.to_i - 1], "airline", "flight_number", "origin", "destination", "airport", "price", "time"
    puts ""
    sleep(1)
    puts "\nWe look forward to flying with you.\n".colorize(:cyan)
    sleep(1)
    puts "\nWould you like to book another flight? Please enter 'yes' or 'no':\n".colorize(:cyan)
    another = gets.chomp
    if another != "yes" && another != "no"
    elsif another == "yes"
      booking
    elsif another == "no"
      puts "\nThank you for booking with weFly.\n".colorize(:cyan)
      main_menu(current)
    end
  elsif choice == "back"
    booking(current)
  elsif choice == "menu"
    main_menu(current)
  else
    puts "\nChoice Not Valid, please try again\n".colorize(:cyan)
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
    puts "Please enter the keyword from the following options:".colorize(:cyan)
    #main menu
    puts ""

    puts "  BOOK   - to book a new flight".colorize(:magenta)
    puts "  VIEW   - to view my existing reservations".colorize(:magenta)
    puts "  UPDATE - to update your account information".colorize(:magenta) # - add to user column #change gender to phone number
    puts "  CANCEL - to cancel your most recent reservation".colorize(:magenta)
    puts "  EXIT   - to end your current session with weFly".colorize(:magenta)
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
    main_menu(current)
  when "UPDATE"
    puts "\nWhat would you like to update?\n".colorize(:cyan)
    puts "  EMAIL  - to update your email".colorize(:magenta)
    puts "  PHONE  - to update your phone number".colorize(:magenta)
    puts "  MENU   - to return to the main menu\n".colorize(:magenta)

    tp current, "name", "email", "phone"
    column = gets.chomp.downcase

    if column == "email"
      new_email = gets.chomp.downcase
      current.update(email: new_email)
    elsif column == "phone"
      new_phone = gets.chomp
      #make sure it includes NUMBERS
      current.update(phone: new_phone)
    elsif column == "menu"
      main_menu(current)
    else
      puts "Please enter a valid response".colorize(:cyan)
      keyword_response("update", current)

    end
    current.update()
    #contains @ - update email
    #contains integers - update phone number
    #else update name



  when "CANCEL"
    puts ""
    puts "Are you sure you want to cancel your last flight? (displayed below)".colorize(:cyan)
    puts "'yes' or 'no'".colorize(:cyan)
    puts ""
    tp current.flights.last,  "airline", "flight_number", "origin", "destination", "airport"
    puts ""
    canceled = gets.chomp.downcase
      if canceled == "yes"
        #user_email = current.email
        found_user = User.all.find_by(email: current.email)
        current = found_user
        current.reservations.last.destroy
        puts "Canceling your last reservation" + "#{loading}"
        sleep(1)
        puts "You have successfully canceled your last flight.".colorize(:cyan)
        puts "Your card will be refunded in the next 3-5 business days.".colorize(:cyan)
        puts "Below is your updated current reservation history.".colorize(:cyan)
        puts ""
        tp current.flights, "airline", "flight_number", "origin", "destination", "airport"
        puts ""

        main_menu(current)
      elsif canceled == "no"
       puts "returning to main menu".colorize(:cyan)
       main_menu(current)
      end
  when "EXIT"
    abort("Leaving weFly.".colorize(:cyan))
  else
    puts "Please enter a valid response".colorize(:cyan)
    keyword = gets.chomp.upcase
    sleep(1)
    keyword_response(keyword, current)
  end
end



def booking(current)
  puts ""
  puts "Please enter the city or the country you want to fly to:".colorize(:cyan)
  puts ""
  city_country = gets.chomp.capitalize
  # find the flight that match the city or the country
  found_options = Flight.where("destination like ?", "%#{city_country}%")
  #if found options = empty array, return
    if found_options.length == 0
      puts "\nSorry, weFly does not travel to that location.\n".colorize(:cyan)
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
  puts "Above are the options for flights to that location.\n".colorize(:cyan)
  puts "\nPlease indicate the option number of the flight you want to book:\n".colorize(:cyan)
  make_reservation(serialed_option, current)

end


def loading
  5.times do
  sleep 0.5
  print "."
  end

end
