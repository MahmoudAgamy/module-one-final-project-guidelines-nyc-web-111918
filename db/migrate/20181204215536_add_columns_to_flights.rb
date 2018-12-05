class AddColumnsToFlights < ActiveRecord::Migration[5.0]
  def change
    add_column(:flights, :origin, :string, :default => "jfk")
    add_column(:flights, :city, :string)
    add_column(:flights, :airport, :string)
    add_column(:flights, :duration, :string)
  end
end
