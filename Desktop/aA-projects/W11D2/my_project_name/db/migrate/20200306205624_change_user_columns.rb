class ChangeUserColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :users,:email,:name
    add_column :users, :username, :string, null: false
    add_index :users, :username, unique: true
  end
end
