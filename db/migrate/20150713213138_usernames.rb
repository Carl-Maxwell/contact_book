class Usernames < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, null: false, default: ""
    remove_column :users, :name
    remove_column :users, :email
    add_index :users, :username, unique: true
  end

end
