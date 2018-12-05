class DeleteTemporariesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :temporaries
  end
end
