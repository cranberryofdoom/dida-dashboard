class AddAttachmentFileToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :file
    end
  end

  def self.down
    drop_attached_file :projects, :file
  end
end
