class Destination < ActiveRecord::Base
  has_many :reservations
  has_many :flights, through: :reservations
  has_many :users, through: :reservations
end
