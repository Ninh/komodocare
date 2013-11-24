class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :title
      t.date :date_created

      t.timestamps
    end
  end
end
