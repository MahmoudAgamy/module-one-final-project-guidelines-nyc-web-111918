class ChangeCityToDestinationColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :flights, :city, :destination
  end
end
