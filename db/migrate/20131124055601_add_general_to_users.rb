class AddGeneralToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :blood_type, :string
    add_column :users, :weight, :string
    add_column :users, :height, :string
  end
end
