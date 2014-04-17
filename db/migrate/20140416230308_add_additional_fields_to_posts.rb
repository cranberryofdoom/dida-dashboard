class AddAdditionalFieldsToPosts < ActiveRecord::Migration
  def change
  	change_table :posts do |t|
			t.string :direct_upload_url
			t.string :attached_file_file_path
		end
  end
end
