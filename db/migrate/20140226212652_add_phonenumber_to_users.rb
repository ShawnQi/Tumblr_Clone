class AddPhonenumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phonenumber, :string
    add_index :users, :phonenumber, unique: true
  end
end
