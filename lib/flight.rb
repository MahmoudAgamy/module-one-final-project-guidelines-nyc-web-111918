class Flight < ActiveRecord::Base
  has_many :reservations
  has_many :destinations, through: :reservations
  has_many :users, through: :reservations
end
