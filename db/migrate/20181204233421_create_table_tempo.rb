class CreateTableTempo < ActiveRecord::Migration[5.0]
  def change
    create_table "airport_codes", force: :cascade do |t|
      t.text "city"
      t.text "airportcode"
    end
  end
end
