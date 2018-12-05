class DeleteColumnFromFlights < ActiveRecord::Migration[5.0]
  def change
    remove_column(:flights, :time_of_departure)
  end
end
