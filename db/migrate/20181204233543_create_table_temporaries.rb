class CreateTableTemporaries < ActiveRecord::Migration[5.0]
  def change
    create_table "temporaries", force: :cascade do |t|
      t.text "city"
      t.text "airportcode"
    end
  end
end
