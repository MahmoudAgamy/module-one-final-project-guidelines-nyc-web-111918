class ChangeColumnNameDestinations < ActiveRecord::Migration[5.0]
  def change
    rename_column  :destinations, :country, :codek
  end
end
