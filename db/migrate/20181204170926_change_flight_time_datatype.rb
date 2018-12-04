class ChangeFlightTimeDatatype < ActiveRecord::Migration[5.0]
  def change
    change_column(:flights, :time_of_departure, :string)
  end
end
