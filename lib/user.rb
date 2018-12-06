class User < ActiveRecord::Base
  has_many :reservations
  has_many :flights, through: :reservations
  has_many :destinations, through: :reservations

# def reservations
#   Reservation.all.select do |current_user|
#     current_user.user_id == self.id
#   end #ends for selecting user's reservations
# end

end
