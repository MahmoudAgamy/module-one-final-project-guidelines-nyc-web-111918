class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :flight
  belongs_to :destination
end
