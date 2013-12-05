class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :commentable_id
      t.string :commentable_type
      t.string :ancestry

      t.timestamps
    end

    add_index :messages, :ancestry
  end
end
