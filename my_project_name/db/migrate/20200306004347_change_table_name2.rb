class ChangeTableName2 < ActiveRecord::Migration[5.2]
  def change
    rename_table :user, :users
  end
end
