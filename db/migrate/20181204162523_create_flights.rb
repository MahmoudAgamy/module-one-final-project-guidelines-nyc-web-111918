class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.text :airline
      t.text :flight_number
      t.time :time_of_departure
    end
  end
end
