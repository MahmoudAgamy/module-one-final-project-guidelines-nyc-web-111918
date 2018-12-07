# weFly ✈️ Airline Ticketing System

Hello! Introducing weFly, the quick, easy to use Airline Ticketing System for JFK Airport!
___

## UWBAT (Users Will Be Able To)

1. `BOOK`   - to book a new flight
2. `VIEW`   - to view my existing reservations
3. `UPDATE` - to update your account information
4. `CANCEL` - to cancel your most recent reservation
5. `EXIT`   - to end your current session with weFly


### Users Guide

When you open weFly, you will be prompted to log in with your email address and full name.

weFly then provides you a menu of options to choose from.

1. `BOOK` - to book a new flight
  Enter `book` into the weFly terminal.
  To book a new flight, weFly will prompt you to enter the city or country of the destination you would like to fly to.
  If the destination is a direct flight from JFK, you will be given a list of options of flights to choose from.

  Select the option number of the flight you would like to purchase a ticket for. You also have an option to enter `back` to enter a different city/country name, or `menu` to return to the main menu.


2. `VIEW` - to view my existing reservations"
  Enter `view` into the weFly terminal. This will display all of your existing reservations. After the table is displayed, you will be directed back to the main menu to choose another command.

3. `UPDATE` - to update your account information"
  Enter `update` into the weFly terminal. Update allows you to make any changes to your email address or phone number.

  Enter `email` to edit your email address, or `phone` to edit your phone number.
  After the update is confirmed, you will be directed back to the main menu.

4. `CANCEL` - to cancel your most recent reservation"
Enter `cancel` into the weFly terminal.
  If you decide that you wanted to cancel your most recent reservation, you have an option to look at your most recent ticket. weFly will ask you to confirm before canceling and processing the refund.
5. `EXIT` - to end your current session with weFly"
Enter `exit` into the weFly terminal. This ends your current session and will display a goodbye message.


## Installation Instructions

1. Clone this repository.
2. Run `bundle install` to install all of the wonderful ruby gems that help make this project work.
3. If you would like the `flights` table of information, you can download the `development.db` file.
4. Enter `rake db:migrate` to run the migrations for this project.
### BE CAREFUL!
    * `rake db:migrate` will create a new `development.db` file for you.
    * Delete this `development.db` file.
    * Take the `development.db` file that you downloaded in step 3, and move it into the `db` folder, by drag and drop.

5. You can now run this project by entering `ruby bin/run.rb`.

## Have fun!

___
### Feel free to contact the weFly founders or developers for any questions.

- Rachel Lum, rlum894@gmail.com
- Mahmoud Agamy, agamyv@gmail.com
___
# Thank you for using weFly ✈️
