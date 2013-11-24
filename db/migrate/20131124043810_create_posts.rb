class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.date :date_created

      t.timestamps
    end
  end
end
