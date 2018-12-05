class CreateAirportCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :airport_codes do |t|
      t.string :city
      t.string :code
    end
  end
end
