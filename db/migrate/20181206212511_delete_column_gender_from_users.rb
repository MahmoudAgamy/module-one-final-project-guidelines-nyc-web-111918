class DeleteColumnGenderFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column(:users, :gender)
  end
end
