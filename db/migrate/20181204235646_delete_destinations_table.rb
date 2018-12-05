class DeleteDestinationsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :destinations
  end
end
