class ChangeAirportcodesDatatype < ActiveRecord::Migration[5.0]
  def change
    change_column :airport_codes, :city, :text
    change_column :airport_codes, :code, :text
  end
end
