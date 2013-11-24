class CreateRelUserBlocks < ActiveRecord::Migration
  def change
    create_table :rel_user_blocks do |t|
      t.integer :user_id
      t.integer :block_id

      t.timestamps
    end
  end
end
