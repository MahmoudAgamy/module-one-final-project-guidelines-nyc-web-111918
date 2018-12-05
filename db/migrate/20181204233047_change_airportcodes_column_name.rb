class ChangeAirportcodesColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :airport_codes, :code, :airportcode
  end
end
