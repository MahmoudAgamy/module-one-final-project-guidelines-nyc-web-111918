class AddThreeColumnsToFlights < ActiveRecord::Migration[5.0]
  def change
    add_column(:flights, :option, :integer)
    add_column(:flights, :price, :integer, :default => rand(200..900))
    add_column(:flights, :time, :string, :default => "#{rand(12...24)}:#{rand(0..59)} PM" )
  end
end
