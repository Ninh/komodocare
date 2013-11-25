class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :commentable_id
      t.integer :user_id
      t.string :commentable_type

      t.timestamps
    end
    add_index :comments, [:user_id, :created_at]
  end
end
