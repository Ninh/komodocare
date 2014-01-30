class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone_number, :decimal
    add_column :users, :birthday, :date
    add_column :users, :home_address, :text
    add_column :users, :hospital_name, :string
    add_column :users, :hospital_phone_number, :decimal
    add_column :users, :er_name, :string
    add_column :users, :er_phone_number, :decimal
  end
end
