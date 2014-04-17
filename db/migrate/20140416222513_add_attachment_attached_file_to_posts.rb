class AddAttachmentAttachedFileToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :attached_file
    end
  end

  def self.down
    drop_attached_file :posts, :attached_file
  end
end
