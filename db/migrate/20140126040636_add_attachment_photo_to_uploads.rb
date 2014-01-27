class AddAttachmentPhotoToUploads < ActiveRecord::Migration
  def self.up
    change_table :uploads do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :uploads, :photo
  end
end
