class CreateMedications < ActiveRecord::Migration
  def self.up
    create_table :medications do |t|
      t.integer :user_id
      t.string :dosage
      t.string :description
      t.timestamps
    end
  end

  def self.down
    drop_table :medications
  end
end
